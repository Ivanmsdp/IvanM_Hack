# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /data/data/com.termux/files/usr/bin/sh

# The CMake executable.
CMAKE_COMMAND = /data/data/com.termux/files/usr/bin/cmake

# The command to remove a file.
RM = /data/data/com.termux/files/usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /data/data/com.termux/files/home/i-Haklab

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data/data/com.termux/files/home/i-Haklab/build

# Include any dependencies generated for this target.
include CMakeFiles/i-haklab.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/i-haklab.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/i-haklab.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/i-haklab.dir/flags.make

CMakeFiles/i-haklab.dir/main.cpp.o: CMakeFiles/i-haklab.dir/flags.make
CMakeFiles/i-haklab.dir/main.cpp.o: /data/data/com.termux/files/home/i-Haklab/main.cpp
CMakeFiles/i-haklab.dir/main.cpp.o: CMakeFiles/i-haklab.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/data/data/com.termux/files/home/i-Haklab/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/i-haklab.dir/main.cpp.o"
	/data/data/com.termux/files/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/i-haklab.dir/main.cpp.o -MF CMakeFiles/i-haklab.dir/main.cpp.o.d -o CMakeFiles/i-haklab.dir/main.cpp.o -c /data/data/com.termux/files/home/i-Haklab/main.cpp

CMakeFiles/i-haklab.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/i-haklab.dir/main.cpp.i"
	/data/data/com.termux/files/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/data/com.termux/files/home/i-Haklab/main.cpp > CMakeFiles/i-haklab.dir/main.cpp.i

CMakeFiles/i-haklab.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/i-haklab.dir/main.cpp.s"
	/data/data/com.termux/files/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/data/com.termux/files/home/i-Haklab/main.cpp -o CMakeFiles/i-haklab.dir/main.cpp.s

# Object files for target i-haklab
i__haklab_OBJECTS = \
"CMakeFiles/i-haklab.dir/main.cpp.o"

# External object files for target i-haklab
i__haklab_EXTERNAL_OBJECTS =

i-haklab: CMakeFiles/i-haklab.dir/main.cpp.o
i-haklab: CMakeFiles/i-haklab.dir/build.make
i-haklab: src/libbelow_zero.so
i-haklab: CMakeFiles/i-haklab.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/data/data/com.termux/files/home/i-Haklab/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable i-haklab"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/i-haklab.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/i-haklab.dir/build: i-haklab
.PHONY : CMakeFiles/i-haklab.dir/build

CMakeFiles/i-haklab.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/i-haklab.dir/cmake_clean.cmake
.PHONY : CMakeFiles/i-haklab.dir/clean

CMakeFiles/i-haklab.dir/depend:
	cd /data/data/com.termux/files/home/i-Haklab/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data/data/com.termux/files/home/i-Haklab /data/data/com.termux/files/home/i-Haklab /data/data/com.termux/files/home/i-Haklab/build /data/data/com.termux/files/home/i-Haklab/build /data/data/com.termux/files/home/i-Haklab/build/CMakeFiles/i-haklab.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/i-haklab.dir/depend

