cmake_minimum_required(VERSION 3.25)
project(PaddleLiteDemo)

set(CMAKE_CXX_STANDARD 11)

set(TARGET_OS "linux")
set(TARGET_ABI ${ARCH})
set(PADDLE_LITE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libs/PaddleLite")
set(OpenCV_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libs/OpenCV")

add_definitions(-D${TARGET_ABI})

message(STATUS "TARGET OS: ${TARGET_OS}")
message(STATUS "TARGET ABI: ${TARGET_ABI}")
message(STATUS "PADDLE LITE DIR: ${PADDLE_LITE_DIR}")
message(STATUS "OpenCV DIR: ${OpenCV_DIR}")

include_directories(${PADDLE_LITE_DIR}/${TARGET_OS}/${TARGET_ABI}/include)
link_directories(${PADDLE_LITE_DIR}/${TARGET_OS}/${TARGET_ABI}/lib)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wl,--allow-shlib-undefined")

set(OpenCV_DIR "${OpenCV_DIR}/${TARGET_OS}/${TARGET_ABI}/lib/cmake/opencv4")
find_package(OpenCV REQUIRED)
if (OpenCV_FOUND OR OpenCV_CXX_FOUND)
    include_directories(${OpenCV_INCLUDE_DIRS})
    message(STATUS "OpenCV library status:")
    message(STATUS "    version: ${OpenCV_VERSION}")
    message(STATUS "    libraries: ${OpenCV_LIBS}")
    message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")
else ()
    message(FATAL_ERROR "OpenCV not found!")
    return()
endif ()

add_library(
        # Sets the name of the library.
        paddle_api_shared
        # Sets the library as a shared library.
        SHARED
        # Provides a relative path to your source file(s).
        IMPORTED)
set_target_properties(
        # Specifies the target library.
        paddle_api_shared
        # Specifies the parameter you want to define.
        PROPERTIES
        IMPORTED_LOCATION
        ${PADDLE_LITE_DIR}/${TARGET_OS}/${TARGET_ABI}/lib/libpaddle_light_api_shared.so
        # Provides the path to the library you want to import.
)



add_subdirectory(image_classification_demo)
add_subdirectory(keypoint_detection_demo)
add_subdirectory(object_detection_demo)
add_subdirectory(semantic_segmentation_demo)
add_subdirectory(model_test)
add_subdirectory(ocr)
