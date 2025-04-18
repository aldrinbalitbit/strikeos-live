#!/bin/bash -e
. init.sh

cd "${_sources_dir}"/binutils

mkdir build && cd build
../configure \
    
