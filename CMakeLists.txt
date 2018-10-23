cmake_minimum_required(VERSION 3.12)
project(raytracer)

set(CMAKE_CXX_STANDARD 17)

set (CMAKE_CXX_FLAGS "-O3 -msse3")

add_executable(Fast-BVH RayTracerTest.cpp BBox.cpp BVH.cpp)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake_modules" ${CMAKE_MODULE_PATH})
find_package(SFML 2 REQUIRED network audio graphics window system)
find_package (Threads)
include_directories(${SFML_INCLUDE_DIR})
target_link_libraries(Fast-BVH ${SFML_LIBRARIES} ${SFML_DEPENDENCIES})
target_link_libraries (Fast-BVH ${CMAKE_THREAD_LIBS_INIT})