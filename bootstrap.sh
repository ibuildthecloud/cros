#!/bin/bash
set -e

mkdir -p ${HOME}/chromiumos
pushd ${HOME}/chromiumos
repo init -u https://chromium.googlesource.com/chromiumos/manifest.git --repo-url https://chromium.googlesource.com/external/repo.git
repo sync -j4

popd
. ./bootstrap2.sh
