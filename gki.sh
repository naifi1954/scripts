#!/usr/bin/env bash
set -e

BASE="https://android.googlesource.com"
DEFAULT_REV="master-kernel-build-2021"
ROOT="$HOME/kernel"

mkdir -p "$ROOT"
cd "$ROOT"

echo "==> Cloning kernel/build"
git clone --depth=1 -b "$DEFAULT_REV" "$BASE/kernel/build" build

echo "==> Cloning kernel/configs"
git clone --depth=1 -b "$DEFAULT_REV" "$BASE/kernel/configs" kernel/configs

echo "==> Cloning kernel/common-modules/virtual-device"
git clone --depth=1 -b android12-5.10 "$BASE/kernel/common-modules/virtual-device" common-modules/virtual-device

echo "==> Cloning prebuilts: clang"
git clone --depth 1 -b "$DEFAULT_REV" "$BASE/platform/prebuilts/clang/host/linux-x86" prebuilts-master/clang/host/linux-x86

echo "==> Cloning prebuilts: gcc"
git clone --depth 1 -b "$DEFAULT_REV" "$BASE/platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8" prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8

echo "==> Cloning prebuilts: build-tools"
git clone --depth 1 -b "$DEFAULT_REV" "$BASE/platform/prebuilts/build-tools" prebuilts/build-tools

echo "==> Cloning prebuilts: kernel-build-tools"
git clone --depth 1 -b "$DEFAULT_REV" "$BASE/kernel/prebuilts/build-tools" prebuilts/kernel-build-tools

echo "==> Cloning tools/mkbootimg"
git clone --depth=1 -b "$DEFAULT_REV" "$BASE/platform/system/tools/mkbootimg" tools/mkbootimg
