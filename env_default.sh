#!/bin/bash
# Default settings for security
# export WAS_ADMIN=wpsadmin
# export WAS_PASSWORD=wpsadminz
# export DX_ADMIN=wpsadmin
# export DX_PASSWORD=wpsadmina

# DX project and namespaces definitions
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export COMPOSE_PROJECT_NAME=dx            # this defines a name prefix that all docker services and containers will inherit
export COMPOSE_FILE=$SCRIPT_DIR/dx.yaml   # this tells docker-compose the name of the docker-compose file (the default name docker-compose.yaml was changed to prevent running it without a proper environment setup)

export DX_HOSTNAME=localhost              # external hostname of dx environment. This normally is just localhost, but may be changed if not running local

# Image registry definition
#
# In case you loaded images to a remote registry (not available locally, not loaded with "docker load" from HCL package)
# then you need to set the registry. If not, set or empty where to lookup local images.
#
# Example for a remote registy at https://registry.mydomain.mytld
#
# Image names are defined in the env_images.sh script
#
export REGISTRY="hclds-registry.factor-y.com"

echo "DX Registry:              $REGISTRY"
echo "DX DX_HOSTNAME:           $DX_HOSTNAME"
echo "DX COMPOSE_FILE:          $COMPOSE_FILE"
echo "DX COMPOSE_PROJECT_NAME:  $COMPOSE_PROJECT_NAME"