#!/bin/bash

# *********************************************************
# Defaults for version and registry
#
export DX_VERSION="${DX_VERSION:-CF223}"
export REGISTRY="${REGISTRY:-hclcr.io}"

#
# DX V9.5 CF223
#
if [ "$DX_VERSION" = "CF223" ]; then
    # hcl-dx-content-composer-image-v1.36.0_20240925-1856.tar.gz
    # hcl-dx-core-image-v95_CF223_20240925-1928.tar.gz
    # hcl-dx-dam-plugin-google-vision-image-v1.0.0_20240925-1857.tar.gz
    # hcl-dx-dam-plugin-kaltura-image-v1.0.0_20240925-1858.tar.gz
    # hcl-dx-deployment-v2.32.1_20240926-1415.tgz
    # hcl-dx-digital-asset-manager-image-v1.35.0_20240925-1915.tar.gz
    # hcl-dx-file-processor-image-v95_CF223_20240925-1912.tar.gz
    # hcl-dx-haproxy-image-v1.19.0_20240925-1915.tar.gz
    # hcl-dx-image-processor-image-v1.36.0_20240925-1909.tar.gz
    # hcl-dx-license-manager-image-v95_CF223_20240925-1902.tar.gz
    # hcl-dx-logging-sidecar-image-v1.0.0_20240925-1904.tar.gz
    # hcl-dx-openldap-image-v1.2.0_20240925-1901.tar.gz
    # hcl-dx-opensearch-image-v95_CF223_20240925-1904.tar.gz
    # hcl-dx-persistence-connection-pool-image-v1.33.0_20240925-1908.tar.gz
    # hcl-dx-persistence-metrics-exporter-image-v1.31.0_20240925-1908.tar.gz
    # hcl-dx-persistence-node-image-v1.23_20240925-1907.tar.gz
    # hcl-dx-prereqs-checker-image-v1.0.0_20240925-1904.tar.gz
    # hcl-dx-remote-search-image-v95_CF223_20240925-1928.tar.gz
    # hcl-dx-ringapi-image-v1.36.0_20240925-1909.tar.gz
    # hcl-dx-runtime-controller-image-v95_CF223_20240925-1904.tar.gz
    # hcl-dx-search-middleware-image-v2.0.0_20240925-0052.tar.gz
    # hcl-dx-search-v2.21.0_20240925-1916.tgz
    # hcl-dxclient-image-v95_CF223_20240925-1921.zip

    export DX_DOCKER_IMAGE_CORE=${REGISTRY:-}/dx/core:v95_CF223_20240925-1928
    export DX_DOCKER_IMAGE_HAPROXY=${REGISTRY:-}/dx/haproxy:v1.19.0_20240925-1915
    export DX_DOCKER_IMAGE_RINGAPI=${REGISTRY:-}/dx/ringapi:v1.36.0_20240925-1909

    # docker pull hclcr.io/dx-public/dxclient:IMAGE_TAG
    # https://hclcr.io/harbor/projects/95/repositories/dxclient/artifacts-tab
    export DX_DOCKER_IMAGE_DXCLIENT=${REGISTRY:-}/dx/dxclient:v95_CF223_20240925-1911
fi

#
# CF222 image tags
#
if [ "$DX_VERSION" = "CF222" ]; then
    # hcl-dx-content-composer-image-v1.35.0_20240814-1243.tar.gz
    # hcl-dx-core-image-v95_CF222_20240814-1259.tar.gz
    # hcl-dx-dam-plugin-google-vision-image-v1.0.0_20240814-1244.tar.gz
    # hcl-dx-dam-plugin-kaltura-image-v1.0.0_20240814-1244.tar.gz
    # hcl-dx-deployment-v2.31.0_20240815-1439.tgz
    # hcl-dx-digital-asset-manager-image-v1.34.0_20240814-1301.tar.gz
    # hcl-dx-haproxy-image-v1.18.0_20240814-1253.tar.gz
    # hcl-dx-image-processor-image-v1.35.0_20240814-1257.tar.gz
    # hcl-dx-license-manager-image-v95_CF222_20240814-1248.tar.gz
    # hcl-dx-logging-sidecar-image-v1.0.0_20240814-1248.tar.gz
    # hcl-dx-openldap-image-v1.2.0_20240814-1243.tar.gz
    # hcl-dx-opensearch-image-v95_CF222_20240814-1248.tar.gz
    # hcl-dx-persistence-connection-pool-image-v1.32.0_20240814-1254.tar.gz
    # hcl-dx-persistence-metrics-exporter-image-v1.30.0_20240814-1253.tar.gz
    # hcl-dx-persistence-node-image-v1.22_20240814-1253.tar.gz
    # hcl-dx-prereqs-checker-image-v1.0.0_20240814-1248.tar.gz
    # hcl-dx-remote-search-image-v95_CF222_20240814-1259.tar.gz
    # hcl-dx-ringapi-image-v1.35.0_20240814-1255.tar.gz
    # hcl-dx-runtime-controller-image-v95_CF222_20240814-1251.tar.gz
    # hcl-dx-search-middleware-image-v2.0.0_20240812-1317.tar.gz
    # hcl-dx-search-v2.20.0_20240814-1253.tgz

    # export DX_DOCKER_IMAGE_CC=${REGISTRY:-}/dx/content-composer:v1.29.0_20231114-2121
    export DX_DOCKER_IMAGE_CORE=${REGISTRY:-}/dx/core:v95_CF222_20240814-1259
    # export DX_DOCKER_IMAGE_DAM=${REGISTRY:-}/dx/digital-asset-manager:v1.28.0_20231114-2142
    # export DX_DOCKER_IMAGE_DAM_DB_NODE=${REGISTRY:-}/dx/persistence-node:v1.19_20231114-2133
    # export DX_DOCKER_IMAGE_DAM_DB_CONNECTION_POOL=${REGISTRY:-}/dx/persistence-connection-pool:v1.29.0_20231114-2135
    # export DX_DOCKER_IMAGE_IMAGE_PROCESSOR=${REGISTRY:-}/dx/image-processor:v1.29.0_20231114-2136
    export DX_DOCKER_IMAGE_HAPROXY=${REGISTRY:-}/dx/haproxy:v1.18.0_20240814-1253
    export DX_DOCKER_IMAGE_RINGAPI=${REGISTRY:-}/dx/ringapi:v1.35.0_20240814-1255
    export DX_DOCKER_IMAGE_PREREQS_CHECKER=${REGISTRY:-}/dx/prereqs-checker:v1.0.0_20240814-1248
fi

#
# CF221 image tags
#
if [ "$DX_VERSION" = "CF221" ]; then

    # HCL DX notices V9.5 CF221.txt
    # hcl-dx-content-composer-image-v1.34.0_20240708-1954.tar.gz
    # hcl-dx-core-image-v95_CF221_20240708-2145.tar.gz
    # hcl-dx-dam-plugin-google-vision-image-v1.0.0_20240708-1954.tar.gz
    # hcl-dx-dam-plugin-kaltura-image-v1.0.0_20240708-1950.tar.gz
    # hcl-dx-deployment-v2.30.0_20240709-2027.tgz
    # hcl-dx-digital-asset-manager-image-v1.33.0_20240708-2012.tar.gz
    # hcl-dx-haproxy-image-v1.17.0_20240708-2007.tar.gz
    # hcl-dx-image-processor-image-v1.34.0_20240708-2015.tar.gz
    # hcl-dx-license-manager-image-v95_CF221_20240708-1955.tar.gz
    # hcl-dx-logging-sidecar-image-v1.0.0_20240708-1957.tar.gz
    # hcl-dx-openldap-image-v1.2.0_20240708-1954.tar.gz
    # hcl-dx-opensearch-image-v95_CF221_20240708-1958.tar.gz
    # hcl-dx-persistence-connection-pool-image-v1.31.0_20240708-2006.tar.gz
    # hcl-dx-persistence-metrics-exporter-image-v1.29.0_20240708-2013.tar.gz
    # hcl-dx-persistence-node-image-v1.21_20240708-2004.tar.gz
    # hcl-dx-prereqs-checker-image-v1.0.0_20240708-2010.tar.gz
    # hcl-dx-remote-search-image-v95_CF221_20240708-2145.tar.gz
    # hcl-dx-ringapi-image-v1.34.0_20240708-2002.tar.gz
    # hcl-dx-runtime-controller-image-v95_CF221_20240708-2006.tar.gz
    # hcl-dx-search-middleware-image-v2.0.0_20240708-0052.tar.gz
    # hcl-dx-search-v2.19.0_20240708-2015.tgz

    export DX_DOCKER_IMAGE_CORE=${REGISTRY:-}/dx/core:v95_CF221_20240708-2145
    export DX_DOCKER_IMAGE_RINGAPI=${REGISTRY:-}/dx/ringapi:v1.34.0_20240708-2002
    export DX_DOCKER_IMAGE_HAPROXY=${REGISTRY:-}/dx/haproxy:v1.17.0_20240708-2007
    export DX_DOCKER_IMAGE_PREREQS_CHECKER=${REGISTRY:-}/dx/prereqs-checker:v1.0.0_20240708-2010

fi

#
# CF191 image tags
#
if [ "$DX_VERSION" = "CF191" ]; then
    export DX_DOCKER_IMAGE_CORE=hcl/dx/core:v95_CF191_20201212-1421
    export DX_DOCKER_IMAGE_RINGAPI=hcl/dx/ringapi:v1.5.0_20201211-2200
fi

echo "DX_VERSION:               $DX_VERSION"
echo "DX_DOCKER_IMAGE_CORE:     $DX_DOCKER_IMAGE_CORE"
echo "DX_DOCKER_IMAGE_HAPROXY:  $DX_DOCKER_IMAGE_HAPROXY"
echo "DX_DOCKER_IMAGE_RINGAPI:  $DX_DOCKER_IMAGE_RINGAPI"
echo "DX_DOCKER_IMAGE_DXCLIENT: $DX_DOCKER_IMAGE_DXCLIENT"