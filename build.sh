#!/bin/bash -e
. init.sh
for i in "${_build_dir}"/*.sh; do
    "${i}" "${1}"
done
