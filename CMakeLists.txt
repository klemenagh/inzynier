cmake_minimum_required(VERSION 2.6)
project(inzynier)

option(COMPILE_GUI "Compile GUI" OFF)

set(CMAKE_C_COMPILER "gcc")
set(CMAKE_CXX_COMPILER "g++")

set(CMAKE_C_FLAGS "-std=c11 -Wall -Werror -Wextra -Wformat --pedantic-errors")
set(CMAKE_CXX_FLAGS "-std=c++11 -Wall -pthread")

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
set(MAN_INSTALL_DIR /usr/share/man)

include_directories("src")
add_subdirectory(src)
