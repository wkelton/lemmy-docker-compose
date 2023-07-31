# lemmy-docker-compose
Docker compose managed lemmy instance meant to be used behined reverse proxy


## Installation

1. Copy samples/env to ./.env and set variables
1. Copy samples/config.hjson and samples/postgresql.conf to config and change appropriately
1. Put postgres password in postgres.env.secrets
1. Do required setup for your pre-existing reverse proxy, see the labels in the docker-compose.yml for an example for traefik
1. Run setup/init.sh
