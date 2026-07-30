#!/usr/bin/env bash
set -euo pipefail

BASE="https://android.googlesource.com"
DEFAULT_REV="master-kernel-build-2021"
ROOT="$HOME/kernel"

mkdir -p "$ROOT"
cd "$ROOT"

clone_repo() {
  local url="$1" branch="$2" dest="$3"

  if [ -d "$dest/.git" ]; then
    echo "==> [skip] $dest udah ada"
    return
  fi

  if [ -d "$dest" ]; then
    echo "==> [warn] $dest ada tapi bukan git repo, hapus dulu manual kalo mau clone ulang"
    return
  fi

  echo "==> Cloning $dest (depth=1)"
  mkdir -p "$(dirname "$dest")"
  git clone --depth=1 -b "$branch" "$url" "$dest"
}

clone_repo "$BASE/kernel/build" "$DEFAULT_REV" "build"
clone_repo "$BASE/kernel/configs" "$DEFAULT_REV" "kernel/configs"
clone_repo "$BASE/kernel/common-modules/virtual-device" "android12-5.10" "common-modules/virtual-device"
clone_repo "$BASE/platform/prebuilts/clang/host/linux-x86" "$DEFAULT_REV" "prebuilts-master/clang/host/linux-x86"
clone_repo "$BASE/platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8" "$DEFAULT_REV" "prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8"
clone_repo "$BASE/platform/prebuilts/build-tools" "$DEFAULT_REV" "prebuilts/build-tools"
clone_repo "$BASE/kernel/prebuilts/build-tools" "$DEFAULT_REV" "prebuilts/kernel-build-tools"
clone_repo "$BASE/platform/system/tools/mkbootimg" "$DEFAULT_REV" "tools/mkbootimg"

mkdir -p common
echo "==> Selesai. Folder 'common' disiapin kosong — taro kernel source lu sendiri di situ."
