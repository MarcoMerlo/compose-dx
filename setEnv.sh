#!/bin/bash

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "[Compose-dx - default] Initializing Docker HCL DX environment"
. ./env_default.sh

if [ -f env_local.sh ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo "[Compose-dx - local] Applying local project overrides"
    . ./env_local.sh
fi

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "[Compose-dx - images] Initializing Docker images variables "
. ./env_images.sh
