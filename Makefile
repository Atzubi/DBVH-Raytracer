simple-target:
	clang++ RayTracerTest.cpp BBox.cpp BVH.cpp -O3 -msse3 -pthread -o RayTracerTest
