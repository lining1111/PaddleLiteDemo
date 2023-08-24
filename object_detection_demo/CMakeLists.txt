add_executable(object_detection_demo demo.cc)
target_link_libraries(object_detection_demo paddle_api_shared ${OpenCV_LIBS})
