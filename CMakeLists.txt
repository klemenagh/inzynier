cmake_minimum_required(VERSION 2.6)
project(inzynier)

set(CMAKE_C_COMPILER "gcc")
set(CMAKE_CXX_COMPILER "g++")

set(CMAKE_C_FLAGS "-std=c99 -Wall -Werror -Wextra -Wformat --pedantic-errors")
set(CMAKE_CXX_FLAGS "-std=c++11 -Wall -pthread")

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

include_directories("src")
add_subdirectory(src)
