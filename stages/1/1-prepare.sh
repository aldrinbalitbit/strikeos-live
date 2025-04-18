#!/bin/bash -e
. init.sh
mkdir -p ${_rootfs_dir} ${_rootfs_sources_dir} ${_rootfs_toolchain_dir}

cd "${_sources_dir}"

# cross compile
_clone git://sourceware.org/git/binutils-gdb.git binutils master
_clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux linux-rolling-lts
_clone git://gcc.gnu.org/git/gcc.git gcc trunk
_clone git://uclibc-ng.org/git/uclibc-ng uclibc-ng master
_dl https://github.com/zlib-ng/zlib-ng/archive/refs/tags/${_zlib_ng_version}.tar.gz zlib-ng-${_zlib_ng_version}.tar.gz
_dl https://github.com/llvm/llvm-project/releases/download/llvmorg-${_llvm_version}/llvm-project-${_llvm_version}.src.tar.xz llvm-project-${_llvm_version}.tar.xz
_clone https://github.com/rust-lang/rust.git rustc master
