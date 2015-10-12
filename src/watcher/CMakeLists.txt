set(WATCHER_SOURCE_FILES
        watcher.c
)

add_executable(watcher ${WATCHER_SOURCE_FILES})

install(TARGETS watcher DESTINATION bin)
