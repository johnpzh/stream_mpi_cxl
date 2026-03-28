# stream_mpi_cxl
Test stream_mpi benchmark on CXL twosisters

# Build
```shell
mkdir build
cd build
cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release
ninja
```

# Run Scripts
Prerequisite: need to build Splash which is a private repository.

Then, for no-cxl version,
```shell
cd playgraph1_init
bash scripts/run01.stream_mpi.no_cxl.2-nodes.sh
```

For cxl version,
```shell
cd playgraph1_init
bash scripts/run00.stream_mpi.with_cxl.2-nodes.sh
```