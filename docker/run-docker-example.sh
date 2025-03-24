#!/bin/bash
project_path=$(dirname "$(dirname "$(realpath "${BASH_SOURCE[0]}")")")

docker run --rm -d \
  -p 31080:1080 \
  -p 31443:1443 \
  -p 36520:6520 \
  --name cf \
  --privileged \
  -v /dev/log:/dev/log \
  -v "${project_path}/cvdhome":/root/cvd_home \
  cuttlefish-orchestration:no-update \
  --resume=false \
  --display0=width=1920,height=1080,dpi=213 \
  $@
