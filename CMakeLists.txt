cmake_minimum_required(VERSION 3.1)
project(inzynier)

set(CMAKE_C_FLAGS "-std=c99")

set(SOURCE_FILES
    main.c
    structures.h
    structures.c)



add_executable(inzynier ${SOURCE_FILES} structures.c)