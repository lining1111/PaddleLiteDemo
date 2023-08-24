cmake_minimum_required(VERSION 3.25)
project(PaddleLiteDemo)

set(CMAKE_CXX_STANDARD 11)

set(TARGET_OS  "linux")
set(TARGET_ABI ${ARCH})
set(PADDLE_LITE_DIR  "${CMAKE_CURRENT_SOURCE_DIR}/libs/PaddleLite")
set(OpenCV_DIR  "${CMAKE_CURRENT_SOURCE_DIR}/libs/OpenCV")

add_subdirectory(image_classification_demo)
add_subdirectory(keypoint_detection_demo)
add_subdirectory(object_detection_demo)
add_subdirectory(semantic_segmentation_demo)
