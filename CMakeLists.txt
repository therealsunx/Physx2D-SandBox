cmake_minimum_required(VERSION 3.16)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(sandbox VERSION 1.0 LANGUAGES CXX DESCRIPTION "Sandbox is a playground for projects built using Physx2D library")

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

file(GLOB_RECURSE SRC_FILES 
    "src/*.cpp"
)
#file(GLOB_RECURSIVE EXTERNALS
#    "external/glad/src/glad.c"
#)

#add_executable(${PROJECT_NAME} ${SRC_FILES} ${EXTERNALS})
add_executable(${PROJECT_NAME} ${SRC_FILES} )

target_include_directories(${PROJECT_NAME} PRIVATE "external/physx2d/include")
target_link_directories(${PROJECT_NAME} PRIVATE "external/physx2d/lib")
target_link_libraries(${PROJECT_NAME} PRIVATE physx2d glfw3)

if(APPLE)
    find_library(OPENGL_LIB OpenGL)
    target_link_libraries(Physx2D PRIVATE ${OPENGL_LIB})
endif()

if (WIN32)
    target_compile_definitions(${PROJECT_NAME} PRIVATE -DPHSX2D_PLATFORM_WINDOWS)
    message("system : WIN32")
elseif (CMAKE_SYSTEM_NAME STREQUAL "Linux")
    target_compile_definitions(${PROJECT_NAME} PRIVATE -DPHSX2D_PLATFORM_LINUX)
    message("system : Linux")
elseif (APPLE)
    target_compile_definitions(${PROJECT_NAME} PRIVATE -DPHSX2D_PLATFORM_APPLE)
    message("system : Apple")
endif()

target_compile_definitions(${PROJECT_NAME} PRIVATE
    $<$<CONFIG:Debug>:PHSX2D_DEBUG;PHSX2D_ASSERT_ENABLE>
    $<$<CONFIG:Release>:PHSX2D_RELEASE;PHSX2D_ASSERT_ENABLE>
    $<$<CONFIG:Dist>:PHSX2D_DIST;PHSX2D_ASSERT_ENABLE>
)

# Setting up the installation to put executable in bin directory
install(TARGETS ${PROJECT_NAME} DESTINATION bin)

# Installer configs
include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set(CPACK_VERSION_MAJOR "${Tutorial_VERSION_MAJOR}")
set(CPACK_VERSION_MINOR "${Tutorial_VERSION_MINOR}")
include(CPack)
