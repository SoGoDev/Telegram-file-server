# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.14.5/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.14.5/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/sogo/Desktop/td

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/sogo/Desktop/td/build

# Include any dependencies generated for this target.
include td/generate/CMakeFiles/remove_documentation.dir/depend.make

# Include the progress variables for this target.
include td/generate/CMakeFiles/remove_documentation.dir/progress.make

# Include the compile flags for this target's objects.
include td/generate/CMakeFiles/remove_documentation.dir/flags.make

td/generate/CMakeFiles/remove_documentation.dir/remove_documentation.cpp.o: td/generate/CMakeFiles/remove_documentation.dir/flags.make
td/generate/CMakeFiles/remove_documentation.dir/remove_documentation.cpp.o: ../td/generate/remove_documentation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sogo/Desktop/td/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object td/generate/CMakeFiles/remove_documentation.dir/remove_documentation.cpp.o"
	cd /Users/sogo/Desktop/td/build/td/generate && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/remove_documentation.dir/remove_documentation.cpp.o -c /Users/sogo/Desktop/td/td/generate/remove_documentation.cpp

td/generate/CMakeFiles/remove_documentation.dir/remove_documentation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/remove_documentation.dir/remove_documentation.cpp.i"
	cd /Users/sogo/Desktop/td/build/td/generate && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sogo/Desktop/td/td/generate/remove_documentation.cpp > CMakeFiles/remove_documentation.dir/remove_documentation.cpp.i

td/generate/CMakeFiles/remove_documentation.dir/remove_documentation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/remove_documentation.dir/remove_documentation.cpp.s"
	cd /Users/sogo/Desktop/td/build/td/generate && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sogo/Desktop/td/td/generate/remove_documentation.cpp -o CMakeFiles/remove_documentation.dir/remove_documentation.cpp.s

# Object files for target remove_documentation
remove_documentation_OBJECTS = \
"CMakeFiles/remove_documentation.dir/remove_documentation.cpp.o"

# External object files for target remove_documentation
remove_documentation_EXTERNAL_OBJECTS =

td/generate/remove_documentation: td/generate/CMakeFiles/remove_documentation.dir/remove_documentation.cpp.o
td/generate/remove_documentation: td/generate/CMakeFiles/remove_documentation.dir/build.make
td/generate/remove_documentation: tdtl/libtdtl.a
td/generate/remove_documentation: td/generate/CMakeFiles/remove_documentation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/sogo/Desktop/td/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable remove_documentation"
	cd /Users/sogo/Desktop/td/build/td/generate && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/remove_documentation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
td/generate/CMakeFiles/remove_documentation.dir/build: td/generate/remove_documentation

.PHONY : td/generate/CMakeFiles/remove_documentation.dir/build

td/generate/CMakeFiles/remove_documentation.dir/clean:
	cd /Users/sogo/Desktop/td/build/td/generate && $(CMAKE_COMMAND) -P CMakeFiles/remove_documentation.dir/cmake_clean.cmake
.PHONY : td/generate/CMakeFiles/remove_documentation.dir/clean

td/generate/CMakeFiles/remove_documentation.dir/depend:
	cd /Users/sogo/Desktop/td/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sogo/Desktop/td /Users/sogo/Desktop/td/td/generate /Users/sogo/Desktop/td/build /Users/sogo/Desktop/td/build/td/generate /Users/sogo/Desktop/td/build/td/generate/CMakeFiles/remove_documentation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : td/generate/CMakeFiles/remove_documentation.dir/depend

