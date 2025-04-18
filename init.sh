# Directory variables
_work_dir="$(pwd)"
_build_dir="${_work_dir}/build"
_stages_dir="${_work_dir}/stages"
_patches_dir="${_work_dir}/patches"
_rootfs_dir="${_work_dir}/.rootfs"
_rootfs_sources_dir="${_rootfs_dir}/sources"
_rootfs_toolchain_dir="${_rootfs_dir}/toolchain"

# build.log
_build_log="${_rootfs_dir}/build.log"

# Version variables
# --- START ---
# - Cross compiler -
#_binutils_version="master"
#_linux_version="linux-rolling-lts"
#_gcc_version="trunk"
#_uclibc_ng_version="master"
_zlib_ng_version="2.2.4"
_llvm_version="20.1.2"
#_rustc_version="master"
# --- END ---

# Functions
_msg() {
    echo -e "\e[1;32m>>\e[m $1"
    echo "\n--- $1 ---" >> ${_build_log} 2>&1
}

_clone() {
    local url=$1
    local dir=$2
    local branch=$3

    _msg "Cloning ${url}"
    git clone -b $branch $url $dir >> ${_build_log} 2>&1

    unset url dir branch
}

_dl() {
    local url=$1
    local file=$2

    _msg "Downloading ${url}"
    wget -O $file $url >> ${_build_log} 2>&1

    _msg "Extracting ${file}"
    case "$file" in
        *.tar.gz) tar -xvzf "$file" >> ${_build_log} 2>&1 ;;
        *.tar.xz) tar -xvJf "$file" >> ${_build_log} 2>&1 ;;
    esac
    rm -v ${file} >> ${_build_log} 2>&1

    unset url file
}
