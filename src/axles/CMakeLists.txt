set(AXLES_SOURCE_FILES
    axles.c
    structures.h
    structures.c
    functions.h
    functions.c
    algorithm.h
    algorithm.c
)

add_executable(axles ${AXLES_SOURCE_FILES})
target_link_libraries(axles m)

install(TARGETS axles DESTINATION bin)
