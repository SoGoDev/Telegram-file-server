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

# Utility rule file for tl_generate_common.

# Include the progress variables for this target.
include td/generate/CMakeFiles/tl_generate_common.dir/progress.make

td/generate/CMakeFiles/tl_generate_common: td/generate/generate_common
td/generate/CMakeFiles/tl_generate_common: ../td/generate/scheme/mtproto_api.tlo
td/generate/CMakeFiles/tl_generate_common: ../td/generate/scheme/telegram_api.tlo
td/generate/CMakeFiles/tl_generate_common: ../td/generate/scheme/secret_api.tlo
td/generate/CMakeFiles/tl_generate_common: ../td/generate/scheme/td_api.tlo
td/generate/CMakeFiles/tl_generate_common: ../td/generate/DoxygenTlDocumentationGenerator.php
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/sogo/Desktop/td/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generate common tl source files"
	cd /Users/sogo/Desktop/td/td/generate && /Users/sogo/Desktop/td/build/td/generate/generate_common && /usr/bin/php DoxygenTlDocumentationGenerator.php scheme/td_api.tl auto/td/telegram/td_api.h

tl_generate_common: td/generate/CMakeFiles/tl_generate_common
tl_generate_common: td/generate/CMakeFiles/tl_generate_common.dir/build.make

.PHONY : tl_generate_common

# Rule to build all files generated by this target.
td/generate/CMakeFiles/tl_generate_common.dir/build: tl_generate_common

.PHONY : td/generate/CMakeFiles/tl_generate_common.dir/build

td/generate/CMakeFiles/tl_generate_common.dir/clean:
	cd /Users/sogo/Desktop/td/build/td/generate && $(CMAKE_COMMAND) -P CMakeFiles/tl_generate_common.dir/cmake_clean.cmake
.PHONY : td/generate/CMakeFiles/tl_generate_common.dir/clean

td/generate/CMakeFiles/tl_generate_common.dir/depend:
	cd /Users/sogo/Desktop/td/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sogo/Desktop/td /Users/sogo/Desktop/td/td/generate /Users/sogo/Desktop/td/build /Users/sogo/Desktop/td/build/td/generate /Users/sogo/Desktop/td/build/td/generate/CMakeFiles/tl_generate_common.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : td/generate/CMakeFiles/tl_generate_common.dir/depend
