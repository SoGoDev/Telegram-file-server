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
include benchmark/CMakeFiles/bench_actor.dir/depend.make

# Include the progress variables for this target.
include benchmark/CMakeFiles/bench_actor.dir/progress.make

# Include the compile flags for this target's objects.
include benchmark/CMakeFiles/bench_actor.dir/flags.make

benchmark/CMakeFiles/bench_actor.dir/bench_actor.cpp.o: benchmark/CMakeFiles/bench_actor.dir/flags.make
benchmark/CMakeFiles/bench_actor.dir/bench_actor.cpp.o: ../benchmark/bench_actor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sogo/Desktop/td/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object benchmark/CMakeFiles/bench_actor.dir/bench_actor.cpp.o"
	cd /Users/sogo/Desktop/td/build/benchmark && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bench_actor.dir/bench_actor.cpp.o -c /Users/sogo/Desktop/td/benchmark/bench_actor.cpp

benchmark/CMakeFiles/bench_actor.dir/bench_actor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bench_actor.dir/bench_actor.cpp.i"
	cd /Users/sogo/Desktop/td/build/benchmark && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sogo/Desktop/td/benchmark/bench_actor.cpp > CMakeFiles/bench_actor.dir/bench_actor.cpp.i

benchmark/CMakeFiles/bench_actor.dir/bench_actor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bench_actor.dir/bench_actor.cpp.s"
	cd /Users/sogo/Desktop/td/build/benchmark && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sogo/Desktop/td/benchmark/bench_actor.cpp -o CMakeFiles/bench_actor.dir/bench_actor.cpp.s

# Object files for target bench_actor
bench_actor_OBJECTS = \
"CMakeFiles/bench_actor.dir/bench_actor.cpp.o"

# External object files for target bench_actor
bench_actor_EXTERNAL_OBJECTS =

benchmark/bench_actor: benchmark/CMakeFiles/bench_actor.dir/bench_actor.cpp.o
benchmark/bench_actor: benchmark/CMakeFiles/bench_actor.dir/build.make
benchmark/bench_actor: tdactor/libtdactor.a
benchmark/bench_actor: tdutils/libtdutils.a
benchmark/bench_actor: /usr/local/opt/openssl/lib/libcrypto.dylib
benchmark/bench_actor: /usr/lib/libz.dylib
benchmark/bench_actor: benchmark/CMakeFiles/bench_actor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/sogo/Desktop/td/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bench_actor"
	cd /Users/sogo/Desktop/td/build/benchmark && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bench_actor.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
benchmark/CMakeFiles/bench_actor.dir/build: benchmark/bench_actor

.PHONY : benchmark/CMakeFiles/bench_actor.dir/build

benchmark/CMakeFiles/bench_actor.dir/clean:
	cd /Users/sogo/Desktop/td/build/benchmark && $(CMAKE_COMMAND) -P CMakeFiles/bench_actor.dir/cmake_clean.cmake
.PHONY : benchmark/CMakeFiles/bench_actor.dir/clean

benchmark/CMakeFiles/bench_actor.dir/depend:
	cd /Users/sogo/Desktop/td/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sogo/Desktop/td /Users/sogo/Desktop/td/benchmark /Users/sogo/Desktop/td/build /Users/sogo/Desktop/td/build/benchmark /Users/sogo/Desktop/td/build/benchmark/CMakeFiles/bench_actor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : benchmark/CMakeFiles/bench_actor.dir/depend

