set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt5Widgets)
find_package(Qt5Core)

set(GUI_SOURCE_FILES
    main.cpp
    gui.cpp
    inputthread.cpp
    )

QT5_WRAP_UI(UI gui.ui)

add_executable(gui ${GUI_SOURCE_FILES} ${UI})

target_link_libraries(gui Qt5::Widgets)
