# compile back-end mex function for mexClass_demo class
matlab_add_mex(NAME mexCounter SRC mexCounter.cpp)
target_compile_features(mexCounter PUBLIC cxx_std_11)
target_link_directories(mexCounter PRIVATE ${CMAKE_SOURCE_DIR})
target_include_directories(mexCounter PRIVATE ${CMAKE_SOURCE_DIR}/include)

# if the compiler is MS VisualC++, add 'mexFunction' to the exported symbols
if(WIN32 AND MSVC)
  set_target_properties(mexCounter PROPERTIES LINK_FLAGS /EXPORT:mexFunction)
endif()

# install
# copy all the m-files to the demo folder
install(DIRECTORY . DESTINATION . FILES_MATCHING PATTERN "*.m") # only copy m files and ignore source files
install(TARGETS mexCounter RUNTIME DESTINATION .)

# go to the subdirectory to build the mexfcn
add_subdirectory(@mexClass)
