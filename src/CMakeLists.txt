include_directories("axles" "watcher" "gui" "man")

add_subdirectory(axles)
add_subdirectory(watcher)
if(COMPILE_GUI)
    add_subdirectory(gui)
endif()
add_subdirectory(man)
