# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/44/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/44/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sebastian/CLionProjects/Fast-BVH

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sebastian/CLionProjects/Fast-BVH/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Fast-BVH.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Fast-BVH.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Fast-BVH.dir/flags.make

CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.o: CMakeFiles/Fast-BVH.dir/flags.make
CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.o: ../RayTracerTest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sebastian/CLionProjects/Fast-BVH/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.o -c /home/sebastian/CLionProjects/Fast-BVH/RayTracerTest.cpp

CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sebastian/CLionProjects/Fast-BVH/RayTracerTest.cpp > CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.i

CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sebastian/CLionProjects/Fast-BVH/RayTracerTest.cpp -o CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.s

CMakeFiles/Fast-BVH.dir/BBox.cpp.o: CMakeFiles/Fast-BVH.dir/flags.make
CMakeFiles/Fast-BVH.dir/BBox.cpp.o: ../BBox.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sebastian/CLionProjects/Fast-BVH/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Fast-BVH.dir/BBox.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Fast-BVH.dir/BBox.cpp.o -c /home/sebastian/CLionProjects/Fast-BVH/BBox.cpp

CMakeFiles/Fast-BVH.dir/BBox.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Fast-BVH.dir/BBox.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sebastian/CLionProjects/Fast-BVH/BBox.cpp > CMakeFiles/Fast-BVH.dir/BBox.cpp.i

CMakeFiles/Fast-BVH.dir/BBox.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Fast-BVH.dir/BBox.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sebastian/CLionProjects/Fast-BVH/BBox.cpp -o CMakeFiles/Fast-BVH.dir/BBox.cpp.s

CMakeFiles/Fast-BVH.dir/BVH.cpp.o: CMakeFiles/Fast-BVH.dir/flags.make
CMakeFiles/Fast-BVH.dir/BVH.cpp.o: ../BVH.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sebastian/CLionProjects/Fast-BVH/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Fast-BVH.dir/BVH.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Fast-BVH.dir/BVH.cpp.o -c /home/sebastian/CLionProjects/Fast-BVH/BVH.cpp

CMakeFiles/Fast-BVH.dir/BVH.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Fast-BVH.dir/BVH.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sebastian/CLionProjects/Fast-BVH/BVH.cpp > CMakeFiles/Fast-BVH.dir/BVH.cpp.i

CMakeFiles/Fast-BVH.dir/BVH.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Fast-BVH.dir/BVH.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sebastian/CLionProjects/Fast-BVH/BVH.cpp -o CMakeFiles/Fast-BVH.dir/BVH.cpp.s

# Object files for target Fast-BVH
Fast__BVH_OBJECTS = \
"CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.o" \
"CMakeFiles/Fast-BVH.dir/BBox.cpp.o" \
"CMakeFiles/Fast-BVH.dir/BVH.cpp.o"

# External object files for target Fast-BVH
Fast__BVH_EXTERNAL_OBJECTS =

Fast-BVH: CMakeFiles/Fast-BVH.dir/RayTracerTest.cpp.o
Fast-BVH: CMakeFiles/Fast-BVH.dir/BBox.cpp.o
Fast-BVH: CMakeFiles/Fast-BVH.dir/BVH.cpp.o
Fast-BVH: CMakeFiles/Fast-BVH.dir/build.make
Fast-BVH: /usr/lib/x86_64-linux-gnu/libsfml-network.so
Fast-BVH: /usr/lib/x86_64-linux-gnu/libsfml-audio.so
Fast-BVH: /usr/lib/x86_64-linux-gnu/libsfml-graphics.so
Fast-BVH: /usr/lib/x86_64-linux-gnu/libsfml-window.so
Fast-BVH: /usr/lib/x86_64-linux-gnu/libsfml-system.so
Fast-BVH: CMakeFiles/Fast-BVH.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sebastian/CLionProjects/Fast-BVH/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable Fast-BVH"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Fast-BVH.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Fast-BVH.dir/build: Fast-BVH

.PHONY : CMakeFiles/Fast-BVH.dir/build

CMakeFiles/Fast-BVH.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Fast-BVH.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Fast-BVH.dir/clean

CMakeFiles/Fast-BVH.dir/depend:
	cd /home/sebastian/CLionProjects/Fast-BVH/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sebastian/CLionProjects/Fast-BVH /home/sebastian/CLionProjects/Fast-BVH /home/sebastian/CLionProjects/Fast-BVH/cmake-build-debug /home/sebastian/CLionProjects/Fast-BVH/cmake-build-debug /home/sebastian/CLionProjects/Fast-BVH/cmake-build-debug/CMakeFiles/Fast-BVH.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Fast-BVH.dir/depend

