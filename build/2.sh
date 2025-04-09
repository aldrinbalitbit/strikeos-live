#!/bin/bash -e
. init.sh
for i in "${_work_dir}"/stages/2/*.sh; do
    "${i}"
done
