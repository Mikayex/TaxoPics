include(windeployqt)

find_package(Qt6 COMPONENTS Widgets REQUIRED)

add_executable(TaxoPics
    main.cpp
)

target_link_libraries(TaxoPics PRIVATE Qt6::Widgets)
windeployqt(TaxoPics)