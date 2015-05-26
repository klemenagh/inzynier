cmake_minimum_required(VERSION 3.1)
project(inzynier)


set(CMAKE_C_COMPILER "gcc")
set(CMAKE_C_FLAGS "-std=c99 -Wall -Werror -Wextra -Wpedantic -Wformat -lm --pedantic-errors")

set(AXLES_SOURCE_FILES
    axles.c
    structures.h
    structures.c
    functions.h
    functions.c
    algorithm.h
    algorithm.c
    )

set(WATCHER_SOURCE_FILES
    watcher.c
    )

include_directories("${PROJECT_SOURCE_DIR}/kiss_fft")
add_subdirectory(kiss_fft)

add_executable(axles ${AXLES_SOURCE_FILES})
target_link_libraries(axles kissfft)

add_executable(watcher ${WATCHER_SOURCE_FILES})