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
include CMakeFiles/tg_cli.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/tg_cli.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tg_cli.dir/flags.make

CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.o: CMakeFiles/tg_cli.dir/flags.make
CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.o: ../td/telegram/cli.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sogo/Desktop/td/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.o -c /Users/sogo/Desktop/td/td/telegram/cli.cpp

CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sogo/Desktop/td/td/telegram/cli.cpp > CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.i

CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sogo/Desktop/td/td/telegram/cli.cpp -o CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.s

CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.o: CMakeFiles/tg_cli.dir/flags.make
CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.o: ../td/generate/auto/td/telegram/td_api_json.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sogo/Desktop/td/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.o -c /Users/sogo/Desktop/td/td/generate/auto/td/telegram/td_api_json.cpp

CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sogo/Desktop/td/td/generate/auto/td/telegram/td_api_json.cpp > CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.i

CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sogo/Desktop/td/td/generate/auto/td/telegram/td_api_json.cpp -o CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.s

# Object files for target tg_cli
tg_cli_OBJECTS = \
"CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.o" \
"CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.o"

# External object files for target tg_cli
tg_cli_EXTERNAL_OBJECTS =

tg_cli: CMakeFiles/tg_cli.dir/td/telegram/cli.cpp.o
tg_cli: CMakeFiles/tg_cli.dir/td/generate/auto/td/telegram/td_api_json.cpp.o
tg_cli: CMakeFiles/tg_cli.dir/build.make
tg_cli: /usr/local/opt/readline/lib/libreadline.dylib
tg_cli: libmemprof.a
tg_cli: libtdclient.a
tg_cli: libtdcore.a
tg_cli: tdtl/libtdtl.a
tg_cli: tdnet/libtdnet.a
tg_cli: /usr/local/opt/openssl/lib/libssl.dylib
tg_cli: tddb/libtddb.a
tg_cli: tdactor/libtdactor.a
tg_cli: tdutils/libtdutils.a
tg_cli: sqlite/libtdsqlite.a
tg_cli: /usr/local/opt/openssl/lib/libcrypto.dylib
tg_cli: /usr/lib/libz.dylib
tg_cli: CMakeFiles/tg_cli.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/sogo/Desktop/td/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable tg_cli"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tg_cli.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/tg_cli.dir/build: tg_cli

.PHONY : CMakeFiles/tg_cli.dir/build

CMakeFiles/tg_cli.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tg_cli.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tg_cli.dir/clean

CMakeFiles/tg_cli.dir/depend:
	cd /Users/sogo/Desktop/td/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sogo/Desktop/td /Users/sogo/Desktop/td /Users/sogo/Desktop/td/build /Users/sogo/Desktop/td/build /Users/sogo/Desktop/td/build/CMakeFiles/tg_cli.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tg_cli.dir/depend
