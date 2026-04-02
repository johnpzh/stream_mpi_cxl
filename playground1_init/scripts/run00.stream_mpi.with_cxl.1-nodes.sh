set -eu

OUTPUT_DIR="output.stream_mpi.with_cxl.2-nodes.$(date +%Y%m%dT%H%M%S)"
hostfile="/home/peng599/pppp/cxlmemsim_project/stream_mpi_cxl/hostfiles/hostfile"
cxl_lib_file="/home/peng599/pppp/cxlmemsim_project/Splash/build/libmpi_cxl_numa_shim.so"

mkdir -p "$OUTPUT_DIR"

cd "$OUTPUT_DIR"

:> output.with_cxl.log
#:> output.with_cxl.realtime.log

binary="../../build/stream_mpi_cxl"

set -x
{
#export CXL_DAX_PATH="/dev/dax1.0" #32GB CXL device on target_node3
#export CXL_MEASURE_LATENCY=1
#LD_PRELOAD="${cxl_lib_file}" \
#/usr/bin/time -f "%e" \
mpirun -x BADSSERVER=twosisters2:50505 \
  --hostfile "${hostfile}" \
  --map-by ppr:1:node \
  -np 1 \
  -x CXL_DAX_PATH="/dev/dax0.1" \
  -x CXL_MEASURE_LATENCY=1 \
  -x LD_PRELOAD="${cxl_lib_file}" \
  "${binary}"
} 2>&1 | tee -a output.with_cxl.log
set +x
#tail -n 1 output.with_cxl.log >> output.with_cxl.realtime.log