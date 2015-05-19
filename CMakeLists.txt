cmake_minimum_required(VERSION 3.1)
project(inzynier)


set(CMAKE_C_COMPILER "gcc")
set(CMAKE_C_FLAGS "-std=c99 -Wall -Werror -Wextra -Wpedantic -Wformat -lm --pedantic-errors")

set(SOURCE_FILES
    main.c
    structures.h
    structures.c
    functions.h
    functions.c
    algorithm.h
    algorithm.c)

include_directories("${PROJECT_SOURCE_DIR}/kiss_fft")
add_subdirectory(kiss_fft)

add_executable(inzynier ${SOURCE_FILES})

target_link_libraries(inzynier kissfft)

