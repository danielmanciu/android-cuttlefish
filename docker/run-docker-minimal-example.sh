#!/bin/bash
project_path=$(dirname "$(dirname "$(realpath "${BASH_SOURCE[0]}")")")

docker run --rm -d \
  --name cf \
  -p 31080:1080 \
  -p 31443:1443 \
  -p 36520:6520 \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  --device /dev/kvm \
  --device /dev/vhost-net \
  --device /dev/vhost-vsock \
  --device /dev/net/tun \
  --security-opt seccomp=unconfined \
  --security-opt apparmor=unconfined \
  -v /dev/log:/dev/log \
  -v "${project_path}/cvdhome":/root/cvd_home \
  cuttlefish-orchestration:no-update \
  --resume=false \
  --display0=width=1920,height=1080,dpi=213 \
  $@
