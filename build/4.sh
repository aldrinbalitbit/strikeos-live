#!/bin/bash -e
. init.sh
for i in "${_stages_dir}"/4/*.sh; do
    "${i}" "${1}"
done
