#!/bin/bash
ref=$(pwd)/chromiumos
ver=$1
mkdir -p $ver
cd $ver
repo init -u https://chromium.googlesource.com/chromiumos/manifest-versions -m buildspecs/${ver}.xml --repo-url https://chromium.googlesource.com/external/repo.git --reference=${ref}
