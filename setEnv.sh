#!/bin/bash

echo
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "[compose-dx] Initializing Docker HCL DX configurations"
. ./env_default.sh

if [ -f env_local.sh ]; then
    echo
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo "[compose-dx] Applying local project overrides"
    . ./env_local.sh
fi

echo
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "[compose-dx] Initializing Docker images variables"
. ./env_images.sh

echo
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "[compose-dx] Initializing persistent volumes locations"
export DX_PROFILE_ROOT="${DX_COMPOSE_ROOT}/volumes/${DX_VERSION}/core/wp_profile"
export DX_DAM_ROOT="${DX_COMPOSE_ROOT}/volumes/${DX_VERSION}/dam" 
echo "DX_PROFILE_ROOT:  ${DX_PROFILE_ROOT}"
echo "DX_DAM_ROOT:      ${DX_DAM_ROOT}"
echo
