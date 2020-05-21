# compile back-end MEX function for mexClass class
set(MEX_FILE "mexfcn") # name of MEX file
set(MEX_FILE_NAME "mexClass_mexfcn.cpp") # source file defining mexFunction()

matlab_add_mex(NAME ${MEX_FILE} SRC ${MEX_FILE_NAME})
target_compile_features(${MEX_FILE} PUBLIC cxx_std_11)
target_link_directories(${MEX_FILE} PRIVATE ${CMAKE_SOURCE_DIR})
target_include_directories(${MEX_FILE} PRIVATE ${CMAKE_SOURCE_DIR}/include)

# install
file(RELATIVE_PATH DstRelativePath "${CMAKE_SOURCE_DIR}/examples" ${CMAKE_CURRENT_SOURCE_DIR})
install(TARGETS ${MEX_FILE} RUNTIME DESTINATION "${DstRelativePath}")
