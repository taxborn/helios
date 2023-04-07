#!/bin/ksh93
typeset -a NVMES=($(diskinfo -Hp | awk '/^NVME/ {print "/dev/dsk/"$2"p0"}'))
DEVS=$(IFS=':'; echo "${NVMES[*]}")
NDEVS=${#NVMES[@]}
fio /root/nvme-max-power.fio --filename "${DEVS}" --numjobs "${NDEVS}"
