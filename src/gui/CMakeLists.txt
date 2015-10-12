set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5Widgets)
find_package(Qt5Core)

set(GUI_SOURCE_FILES
    main.cpp
    gui.cpp
    inputthread.cpp
)
set(GUI_HEADER_FILES
    gui.h
)

QT5_WRAP_CPP(GUI_SOURCE_FILES ${GUI_HEADER_FILES})
QT5_WRAP_UI(UI gui.ui)

add_executable(axles_gui ${GUI_SOURCE_FILES} ${HEADERS} ${UI})
target_link_libraries(axles_gui Qt5::Widgets)

install(TARGETS axles_gui DESTINATION bin)
