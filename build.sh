#!/bin/bash -e
. init.sh
for i in "${_work_dir}"/build/*.sh; do
    "${i}"
done
