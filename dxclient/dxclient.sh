#!/bin/bash
# setup image
# https://github.com/HCL-TECH-SOFTWARE/dxclient-scripts
# docker pull hclcr.io/dx-public/dxclient:IMAGE_TAG
DXCLIENT_IMAGE_REGISTRY="hclds-registry.factor-y.com"
DXCLIENT_IMAGE_NAME="dx/dxclient"
DXCLIENT_IMAGE_TAG="v95_CF223_20240925-1911GGG"
DXCLIENT_IMAGE="${DX_DOCKER_IMAGE_DXCLIENT:-${DXCLIENT_IMAGE_REGISTRY}/${DXCLIENT_IMAGE_NAME}:${DXCLIENT_IMAGE_TAG}}"

# execute dxclient
# --rm removes the stopped container
echo "With ${DXCLIENT_IMAGE}"
docker run -e TZ=Europe/Rome --rm --platform linux/amd64 \
  --network="host" \
  -v "$(pwd)":/dxclient/store \
  -v $WRK_ARTIFACTS:/dxclient/store/artifacts \
  -v $WRK_XMLACCESS:/dxclient/store/xmlaccess \
  ${DXCLIENT_IMAGE} -- bin/dxclient $@