cmake_minimum_required(VERSION 3.14...3.27)

project(iri2026
LANGUAGES Fortran
DESCRIPTION "iri2026 command line driver"
HOMEPAGE_URL https://github.com/space-physics/iri2016
)

enable_testing()

option(BUILD_TESTING "build tests")

# --- main program

add_subdirectory(src)

add_executable(iri2026_driver src/iri_driver.f90 $<TARGET_OBJECTS:iri>)
set_property(TARGET iri2026_driver PROPERTY RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

if(WIN32 AND CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
  # self-contained exe: no MinGW runtime DLLs needed on PATH (e.g. when run from Matlab)
  target_link_options(iri2026_driver PRIVATE -static)
endif()

if(BUILD_TESTING)

add_executable(test_iri src/test.f90 $<TARGET_OBJECTS:iri>)
add_test(NAME IRI COMMAND test_iri WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

endif()
