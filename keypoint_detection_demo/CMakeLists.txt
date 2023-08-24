add_executable(keypoint_detection_demo demo.cc)
target_link_libraries(keypoint_detection_demo paddle_api_shared ${OpenCV_LIBS})
