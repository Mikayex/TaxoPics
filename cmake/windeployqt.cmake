find_package(Qt6 COMPONENTS Core REQUIRED)

# get absolute path to qmake, then use it to find windeployqt executable
get_target_property(_qmake_executable Qt6::qmake IMPORTED_LOCATION)
get_filename_component(_qt_bin_dir "${_qmake_executable}" DIRECTORY)

function(windeployqt target)
    add_custom_command(TARGET ${target} POST_BUILD
        COMMAND "${_qt_bin_dir}/windeployqt.exe"         
                --verbose 1
                $<IF:$<CONFIG:Debug>,--debug,--release>
                --no-compiler-runtime
                --no-opengl
                --no-opengl-sw
                --no-system-d3d-compiler
                --no-quick-import
                --no-virtualkeyboard
                \"$<TARGET_FILE:${target}>\"
        COMMENT "Deploying Qt libraries for '${target}'..."
    )
endfunction()