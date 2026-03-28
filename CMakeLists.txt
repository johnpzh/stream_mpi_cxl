cmake_minimum_required(VERSION 3.30)
project(stream_mpi_cxl C CXX)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_VERBOSE_MAKEFILE ON)

find_package(OpenMP REQUIRED)
find_package(MPI REQUIRED)

add_executable(stream_mpi_cxl src/stream_mpi.c)
target_include_directories(stream_mpi_cxl PRIVATE ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(stream_mpi_cxl PRIVATE MPI::MPI_C OpenMP::OpenMP_C)