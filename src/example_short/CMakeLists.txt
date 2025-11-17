file(GLOB_RECURSE HEADER_LIST CONFIGURE_DEPENDS "${PROJECT_SOURCE_DIR}/src/example_short/*.h")
file(GLOB_RECURSE SOURCES_LIST CONFIGURE_DEPENDS "${PROJECT_SOURCE_DIR}/src/example_short/*.cpp")

add_executable(example_short main.cpp)

target_compile_features(example_short PRIVATE cxx_std_23)
target_compile_options(example_short PRIVATE -Wall -Wextra -pedantic -Werror)

