#!/bin/bash

# *********************************************************
# DX project and namespaces definitions
# Defines a name prefix that all docker services and containers will inherit
export COMPOSE_PROJECT_NAME=dx
# This normally is just localhost, but may be changed if not running local
export DX_HOSTNAME=localhost

# *********************************************************
# Don't change the following assignements:
# used by makefile and justfile to allow resources lookup
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export DX_COMPOSE_ROOT=$SCRIPT_DIR            # Base project root
export COMPOSE_FILE=$DX_COMPOSE_ROOT/dx.yaml  # Tells docker-compose the name of the compose file
export WRK_ROOT=${DX_COMPOSE_ROOT}/work       # main workspace location
export WRK_ENVS=${WRK_ROOT}/env               # folder containing per-environment configurations
export WRK_ARTIFACTS=${WRK_ROOT}/artifacts    # folder containing artifacts to deploy
export WRK_XMLACCESS=${WRK_ROOT}/xmlaccess    # folder containing xmlaccess to apply / export

# create resources if not already present
res=("$WRK_ENVS" "$WRK_ARTIFACTS" "$WRK_XMLACCESS")
for f in "${res[@]}"; do
    if [ ! -d "$f" ]; then
        echo "-> creating $f"
        mkdir -p "$f"
    fi
done

# ${WAS_ADMIN:=wpsadmin}
# ${WAS_PASSWORD:=wpsadmin}
# ${DX_ADMIN:=wpsadmin}
# ${DX_PASSWORD:=wpsadmin}

# just logging
echo
echo "COMPOSE PROJECT_NAME: $COMPOSE_PROJECT_NAME"
echo "COMPOSE HOSTNAME:     $DX_HOSTNAME"
echo
echo "COMPOSE ROOT:         $DX_COMPOSE_ROOT"
echo "COMPOSE FILE:         $COMPOSE_FILE"
echo "WORKSPACE ROOT:       $WRK_ROOT"
