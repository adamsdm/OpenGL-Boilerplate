# Project definition
cmake_minimum_required(VERSION 3.1)
project(OpenGL-Boilerplate)

set(SRC_DIR     "${CMAKE_CURRENT_SOURCE_DIR}/Source")
set(EXT_DIR     "${CMAKE_CURRENT_SOURCE_DIR}/External")
set(GLM_DIR     "${EXT_DIR}/glm")
set(GLFW_DIR    "${EXT_DIR}/glfw")
set(GLAD_DIR    "${EXT_DIR}/glad")

file(GLOB PROJECT_SHADERS   ${CMAKE_CURRENT_SOURCE_DIR}/shaders/*.glsl)
file(GLOB PROJECT_SOURCES   ${SRC_DIR}/*.cpp)
file(GLOB PROJECT_HEADERS   ${SRC_DIR}/*.h)


source_group("Sources" FILES ${PROJECT_SOURCES})
source_group("Headers" FILES ${PROJECT_HEADERS})
source_group("Shaders" FILES ${PROJECT_SHADERS})


add_executable(${PROJECT_NAME}  ${PROJECT_SOURCES}
                                ${PROJECT_HEADERS}
                                ${PROJECT_SHADERS})


target_include_directories(${PROJECT_NAME} PRIVATE "${SRC_DIR}")
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 11)

# GLM
include_directories(${GLM_DIR})

# GLFW
option(GLFW_BUILD_DOCS OFF)
option(GLFW_BUILD_EXAMPLES OFF)
option(GLFW_BUILD_TESTS OFF)
add_subdirectory("${GLFW_DIR}")

target_link_libraries(${PROJECT_NAME} "glfw" "${GLFW_LIBRARIES}")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLFW_DIR}/include")
target_compile_definitions(${PROJECT_NAME} PRIVATE "GLFW_INCLUDE_NONE")

# GLAD
add_library("glad" "${GLAD_DIR}/src/glad.c")
target_include_directories("glad" PRIVATE "${GLAD_DIR}/include")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLAD_DIR}/include")
target_link_libraries(${PROJECT_NAME} "glad" "${CMAKE_DL_LIBS}")