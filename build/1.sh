#!/bin/bash -e
. init.sh
for i in "${_work_dir}"/stages/1/*.sh; do
    "${i}"
done
