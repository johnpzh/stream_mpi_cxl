set -eu

OUTPUT_DIR="output.stream_mpi.no_cxl.2-nodes.$(date +%Y%m%dT%H%M%S)"
hostfile="/home/peng599/pppp/cxlmemsim_project/stream_mpi_cxl/hostfiles/hostfile"

mkdir -p "$OUTPUT_DIR"

cd "$OUTPUT_DIR"

:> output.no_cxl.log
:> output.no_cxl.realtime.log

binary="../../build/stream_mpi_cxl"

set -x
{
/usr/bin/time -f "%e" \
mpirun -x BADSSERVER=twosisters2:50505 \
  --hostfile "${hostfile}" \
  --map-by ppr:1:node \
  -np 2 \
  "${binary}"
} 2>&1 | tee -a output.no_cxl.log
set +x
tail -n 1 output.no_cxl.log >> output.no_cxl.realtime.log