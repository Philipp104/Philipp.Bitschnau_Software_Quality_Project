cmake_minimum_required(VERSION 3.14)
project(ci_raspberry_python C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_library(mathlib src/mathlib.c)
target_include_directories(mathlib PUBLIC include)

add_executable(app src/main.c)
target_link_libraries(app PRIVATE mathlib)

enable_testing()
include(FetchContent)
FetchContent_Declare(
  unity
  GIT_REPOSITORY https://github.com/ThrowTheSwitch/Unity.git
  GIT_TAG v2.6.0
)
FetchContent_MakeAvailable(unity)

add_executable(test_mathlib test/test_mathlib.c)
target_link_libraries(test_mathlib PRIVATE mathlib unity)
add_test(NAME test_mathlib COMMAND test_mathlib)
