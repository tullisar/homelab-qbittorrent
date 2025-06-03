#!/bin/bash

run_compose() {
  docker compose \
    -f ./compose.yaml \
    -f /srv/containers/shared/networking/networks/shared_bridge/compose.shared_bridge.yaml \
    -f /srv/containers/shared/networking/hosts/conflux/compose.gluetun.yaml \
    -f /srv/containers/shared/networking/hosts/conflux/compose.qbittorrent.yaml \
    --env-file /srv/containers/shared/networking/networks/shared_bridge/shared_bridge.env \
    --env-file /srv/containers/shared/environment/common.env \
    --env-file ./run/.env \
    "$@"
}

# If no arguments are passed, default to "up -d"
if [ $# -eq 0 ]; then
  set -- up -d
fi

run_compose "$@"

# If "up" is in the arguments, output the full config after bringing up the stack
if [[ " $* " == *" up "* ]]; then
  run_compose config > run/compose.full.yaml
fi