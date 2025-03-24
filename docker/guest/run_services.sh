#!/usr/bin/env bash

service nginx start
service cuttlefish-host-resources start
service cuttlefish-operator start
service cuttlefish-host_orchestrator start

CVD_HOME=/root/cvd_home

# By default, deny anonymous usage statistics
ANDROID_EMU_TELEMETRY=${ANDROID_EMU_TELEMETRY:-false}

if [ -f $CVD_HOME/bin/launch_cvd ]; then
  cd $CVD_HOME

  HOME=$CVD_HOME ./bin/launch_cvd --num_instances=1 \
   --daemon \
   --start_webrtc=true \
   -console=true \
   $@

  # /root/cvd_home/bin/cvd start \
  #   --vhost-user-vsock=true \
  #   --report_anonymous_usage_stats=y \
  #   $@
fi

# To keep it running
tail -f /dev/null
