#include <cstdio>
#include <vector>
#include <cstdlib>
#include <thread>
#include <iostream>
#include "BVH.h"
#include "Sphere.h"
#include <SFML/Graphics.hpp>

using std::vector;

const unsigned int width = 1024, height = 1024;

// Allocate space for some image pixels
float* pixels = new float[width * height * 3];

// Create a camera from position and focus point
Vector3 camera_position(5, 1, 5);
Vector3 camera_focus(0, 0, 0);
Vector3 camera_up(0, 1, 0);

// Camera tangent space
Vector3 camera_dir = normalize(camera_focus - camera_position);
Vector3 camera_u = normalize(camera_dir ^ camera_up);
Vector3 camera_v = normalize(camera_u ^ camera_dir);

// Return a random number in [0,1]
float rand01() {
  return rand() * (1.f / RAND_MAX);
}

// Return a random vector with each component in the range [-1,1]
Vector3 randVector3() {
  return Vector3(rand01(), rand01(), rand01())*2.f - Vector3(1,1,1);
}


void worker(BVH *bvh,size_t width_from, size_t width_to, size_t height_from, size_t height_to) {
    // Raytrace over every pixel
#pragma omp parallel for
    for (size_t i = width_from; i < width_to; ++i) {
        for (size_t j = height_from; j < height_to; ++j) {
            size_t index = 3 * (width * j + i);

            float u = (i + .5f) / (float) (width - 1) - .5f;
            float v = (height - 1 - j + .5f) / (float) (height - 1) - .5f;
            float fov = .5f / tanf(70.f * 3.14159265 * .5f / 180.f);

            // This is only valid for square aspect ratio images
            Ray ray(camera_position, normalize(u * camera_u + v * camera_v + fov * camera_dir));

            IntersectionInfo I;
            bool hit = bvh->getIntersection(ray, &I, false);

            if (!hit) {
                pixels[index] = pixels[index + 1] = pixels[index + 2] = 0.f;
            } else {

                // Just for fun, we'll make the color based on the normal
                const Vector3 normal = I.object->getNormal(I);
                const Vector3 color(fabs(normal.x), fabs(normal.y), fabs(normal.z));

                //if(index > width*height) std::cout << index << std::endl;
                pixels[index] = color.x;
                pixels[index + 1] = color.y;
                pixels[index + 2] = color.z;
            }
        }
    }
}



int main(int argc, char **argv) {
    // Create a million spheres packed in the space of a cube
    const unsigned int N = 1000000;
    vector<Object *> objects;
    printf("Constructing %d spheres...\n", N);
    for (size_t i = 0; i < N; ++i) {
        objects.push_back(new Sphere(randVector3(), .005f));
    }

    // Compute a BVH for this object set
    BVH test(&objects);
    //return 0;

    printf("Rendering image (%dx%d)...\n", width, height);

    /*FILE *image = fopen("render.ppm", "w");
    fprintf(image, "P6\n%d %d\n255\n", width, height);*/

    size_t threadcount = 64;
    size_t side = width/sqrt(threadcount);
    //std::cout << side;

    sf::RenderWindow window(sf::VideoMode(width, height), "render test");

    int counter = 0;

    while(window.isOpen()){
        auto t1 =  std::chrono::high_resolution_clock::now();
        std::thread workers[threadcount];
        for(size_t x = 0; x < sqrt(threadcount); x++){
            for(size_t y = 0; y < sqrt(threadcount); y++){
                //std::cout << x*side << " " << (x+1)*side << " " << y*side << " " << (y+1)*side << std::endl;
                workers[x*(int)sqrt(threadcount)+y] = std::thread(
                        [&](BVH *bvh, size_t width_from, size_t width_to, size_t height_from, size_t height_to) {
                            worker(bvh, width_from, width_to, height_from, height_to);
                        },
                        &test, x*side, (x+1)*side, y*side, (y+1)*side);
            }
        }
        for(size_t i = 0; i < threadcount; i++){
            workers[i].join();
        }
        sf::Event event;
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        sf::Image image;
        image.create(width, height, sf::Color::Black);

        for(unsigned int x = 0; x < width; x++){
            for(unsigned int y = 0; y < height; y++) {
                size_t i = 3 * (width * y + x);
                sf::Color c;
                c.r = std::max(std::min(pixels[i] * 255.f, 255.f), 0.f);
                c.g = std::max(std::min(pixels[i + 1] * 255.f, 255.f), 0.f);
                c.b = std::max(std::min(pixels[i + 2] * 255.f, 255.f), 0.f);
                image.setPixel(x, y, c);
            }
        }

        sf::Texture texture;
        texture.loadFromImage(image);
        sf::Sprite sprite;
        sprite.setTexture(texture, true);

        window.clear();
        window.draw(sprite);
        window.display();

        counter = (counter+1)%60;
        if(counter == 0){
            camera_position.x = 5;
            camera_position.y = 1;
            camera_position.z = 5;
        }

        camera_position.x = camera_position.x * cos(0.1) - camera_position.z * sin(0.1);
        camera_position.z = camera_position.z * cos(0.1) + camera_position.x * sin(0.1);

        camera_dir = normalize(camera_focus - camera_position);
        camera_u = normalize(camera_dir ^ camera_up);
        camera_v = normalize(camera_u ^ camera_dir);

        //std::cout << camera_dir.x << " " << camera_dir.y << " " << camera_dir.z << std::endl;

        auto t2 = std::chrono::high_resolution_clock::now();
        auto time = std::chrono::duration_cast<std::chrono::duration<double>>(t2 - t1);;
        std::cout << time.count() << std::endl;
    }

    // Output image file (PPM Format)
    printf("Writing out image file: \"render.ppm\"\n");
    FILE *image = fopen("render.ppm", "w");
    fprintf(image, "P6\n%d %d\n255\n", width, height);
    for (size_t j = 0; j < height; ++j) {
        for (size_t i = 0; i < width; ++i) {
            size_t index = 3 * (width * j + i);
            unsigned char r = std::max(std::min(pixels[index] * 255.f, 255.f), 0.f);
            unsigned char g = std::max(std::min(pixels[index + 1] * 255.f, 255.f), 0.f);
            unsigned char b = std::max(std::min(pixels[index + 2] * 255.f, 255.f), 0.f);
            fprintf(image, "%c%c%c", r, g, b);
        }
    }
    fclose(image);

    return 0;

    // Raytrace over every pixel
#pragma omp parallel for
    for (size_t i = 0; i < width; ++i) {
        for (size_t j = 0; j < height; ++j) {
            size_t index = 3 * (width * j + i);

            float u = (i + .5f) / (float) (width - 1) - .5f;
            float v = (height - 1 - j + .5f) / (float) (height - 1) - .5f;
            float fov = .5f / tanf(70.f * 3.14159265 * .5f / 180.f);

            // This is only valid for square aspect ratio images
            Ray ray(camera_position, normalize(u * camera_u + v * camera_v + fov * camera_dir));

            IntersectionInfo I;
            bool hit = test.getIntersection(ray, &I, false);

            if (!hit) {
                pixels[index] = pixels[index + 1] = pixels[index + 2] = 0.f;
                /*size_t index = 3*(width * j + i);
                unsigned char r = std::max(std::min(0.f*255.f, 255.f), 0.f);
                unsigned char g = std::max(std::min(0.f*255.f, 255.f), 0.f);
                unsigned char b = std::max(std::min(0.f*255.f, 255.f), 0.f);
                fprintf(image, "%c%c%c", r,g,b);*/
            } else {

                // Just for fun, we'll make the color based on the normal
                const Vector3 normal = I.object->getNormal(I);
                const Vector3 color(fabs(normal.x), fabs(normal.y), fabs(normal.z));

                pixels[index] = color.x;
                pixels[index + 1] = color.y;
                pixels[index + 2] = color.z;

                /*size_t index = 3*(width * j + i);
                unsigned char r = std::max(std::min(color.x*255.f, 255.f), 0.f);
                unsigned char g = std::max(std::min(color.y*255.f, 255.f), 0.f);
                unsigned char b = std::max(std::min(color.z*255.f, 255.f), 0.f);
                fprintf(image, "%c%c%c", r,g,b);*/
            }
        }
    }

    // Output image file (PPM Format)
    /*printf("Writing out image file: \"render.ppm\"\n");
    FILE *image = fopen("render.ppm", "w");
    fprintf(image, "P6\n%d %d\n255\n", width, height);
    for (size_t j = 0; j < height; ++j) {
        for (size_t i = 0; i < width; ++i) {
            size_t index = 3 * (width * j + i);
            unsigned char r = std::max(std::min(pixels[index] * 255.f, 255.f), 0.f);
            unsigned char g = std::max(std::min(pixels[index + 1] * 255.f, 255.f), 0.f);
            unsigned char b = std::max(std::min(pixels[index + 2] * 255.f, 255.f), 0.f);
            fprintf(image, "%c%c%c", r, g, b);
        }
    }
    fclose(image);*/

    // Cleanup
    delete[] pixels;
}
