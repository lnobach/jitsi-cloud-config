#!/usr/bin/env bash

YQ_VERSION=v4.2.1
YQ_BINARY=yq_linux_amd64

set -e

# === Install yq

if [ -f /usr/bin/yq ]; then
  echo "yq already present, continuing."
else
  echo "Getting yq first..."
  curl -fL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/${YQ_BINARY}.tar.gz |\
    tar -xzO ./${YQ_BINARY} > /usr/bin/yq
  chmod +x /usr/bin/yq
fi

# === Patch docker-compose.yaml

EVALSTR='.services.web.volumes += ["/opt/app/customization/customize.sh:/etc/cont-init.d/90-customweb:ro"] | .services.web.environment += ["CUSTOMIZE_BASE"]'

cp -n /opt/jitsi/docker-compose.yml /opt/jitsi/docker-compose-orig.yml || true
yq eval "$EVALSTR" \
  /opt/jitsi/docker-compose-orig.yml > /opt/jitsi/docker-compose.yml
