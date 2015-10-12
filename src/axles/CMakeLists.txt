set(AXLES_SOURCE_FILES
        axles.c
        structures.h
        structures.c
        functions.h
        functions.c
        algorithm.h
        algorithm.c
)

include_directories("kiss_fft")
add_subdirectory(kiss_fft)

add_executable(axles ${AXLES_SOURCE_FILES})
target_link_libraries(axles kissfft)
target_link_libraries(axles m)

install(TARGETS axles DESTINATION bin)
