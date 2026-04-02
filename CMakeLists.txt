cmake_minimum_required(VERSION 3.30)
project(stream_mpi_cxl C CXX)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_VERBOSE_MAKEFILE ON)

# Rapid Library
set(CMAKE_PREFIX_PATH "/share/micron/rapid/install/gcc-debug")
find_package(rapid CONFIG REQUIRED)
include_directories("${CMAKE_SOURCE_DIR}/include")
include_directories("/share/micron/rapid/install/vcpkg_installed/x64-linux/include")
link_directories("/share/micron/rapid/install/vcpkg_installed/x64-linux/lib")

find_package(OpenMP REQUIRED)
find_package(MPI REQUIRED)

# DRAM MPI
add_executable(stream_mpi_no_cxl src/stream_mpi.c)
target_link_libraries(stream_mpi_no_cxl PRIVATE MPI::MPI_C OpenMP::OpenMP_C)

# CXL MPI
add_executable(stream_mpi_with_cxl src/stream_mpi_with_cxl.c)
target_link_libraries(stream_mpi_with_cxl PRIVATE MPI::MPI_C OpenMP::OpenMP_C rapid::rapid)