set -eu

hostfile="/home/peng599/pppp/cxlmemsim_project/stream_mpi_cxl/hostfiles/hostfile"

set -x
mpirun -x BADSSERVER=twosisters2:50505 \
  --hostfile "${hostfile}" \
  --map-by ppr:2:node \
  -np 4 \
  hostname
set +x