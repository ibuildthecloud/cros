#!/bin/bash
set -e
cd ${HOME}/chromiumos
source ${HOME}/.bashrc
cros_sdk --nouse-image -- ./set_shared_user_password.sh
cros_sdk -- ./setup_board --default --board=${BOARD}
cros_sdk -- env ACCEPT_LICENSE=Google-TOS ./build_packages
cros_sdk -- ./build_image --noenable_rootfs_verification test
