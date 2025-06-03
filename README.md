# Homelab - qBittorrent + Gluetun

This repository contains the docker compose file and relevant non-secret environment
variables and configuration data for the qBittorrent service. The stack also bundles
in the Gluetun service to route Torrent traffic through a VPN network.

See: 
- https://github.com/qbittorrent/qBittorrent
- https://github.com/qdm12/gluetun

## Deploying

The script `./deploy.sh` can be used to bring up the stack. See below for required
environment variables for interpolation. Alternatively it can be deployed through
Komodo by providing it relevant parameters for interpolation.

### Compose Overrides

The services defined in `compose.yaml` do not have any networks specified. The network
configuration is defined in compose override files. These are specified in the deploy
script. 

Alternately, the compose files (including the base `compose.yaml` file) can be listed
under the "Files" section when defining the stack.

### Environment Variables

The following environment variables must be available for interpolation when deploying this stack

- `TORRENT_PORT`: The port to use for BitTorrent traffic
- `GLUETUN_OPENVPN_USER`: The Gluetun OpenVPN username
- `GLUETUN_OPENVPN_PASSWORD`: The Gluetun OpenVPN password
- `GLUETUN_SERVER_REGIONS`: The Gluetun VPN server regions to use
- `GLUETUN_DNS`: The DNS server to use for the Gluetun containet.
- `GLUETUN_DATA_DIR`: The bind mount path for Gluetun data
- `QBITTORRENT_DATA_DIR`: The bind mount path for qBittorrent data
- `QBITTORRENT_TORRENT_DIR`: The bind mount path for torrent downloads.

These can be specified in the "Environment Variables" section of Komodo, which can be instructed to generate the .env file at `run/.env`. All files within the `run` directory are ignored by this repository.