# lemmy-docker-compose
Docker compose managed lemmy instance meant to be used behined reverse proxy

## Docker Images
* Lemmy: [dessalines/lemmy](https://hub.docker.com/r/dessalines/lemmy)
* Lemmy-ui: [dessalines/lemmy-ui](https://hub.docker.com/r/dessalines/lemmy-ui)
* Postgres: [postgres](https://hub.docker.com/_/postgres)
* NGINX: [nginxinc/nginx-unprivilege](https://hub.docker.com/r/nginxinc/nginx-unprivileged)
* Volume provisioner: [hasnat/volumes-provisioner](https://hub.docker.com/r/hasnat/volumes-provisioner)

## Requirements
* Docker
* docker-compose
* A reverse proxy

## Reverse Proxy
You will need to have a reverse proxy setup. I use a variant of [jwilder/nginx-proxy](https://github.com/nginx-proxy/nginx-proxy). [Traefik](https://doc.traefik.io/traefik/getting-started/quick-start/) and [Caddy2](https://caddyserver.com/docs/quick-starts/reverse-proxy) are popular choices.

See [administration/install_docker](https://join-lemmy.org/docs/administration/install_docker.html) for Lemmy docs on setup and configuration.

## Initial Setup
1. Copy samples/env to ./.env and set variables
1. Copy samples/postgres.env.secrets and samples/pictrs.env.secrets to ./ and add the postgres and pictrs passwords respectively
1. Copy samples/config.hjson and samples/postgresql.conf to config and change appropriately
1. Do required setup for your pre-existing reverse proxy, see the labels in the docker-compose.yml for an example for traefik
1. Run setup/init.sh

## Updating
1. Update image tags in your .env file
1. docker-compose pull
1. docker-compose down
1. docker-compose up

## Reference

### Lemmy Docs
* Github: [lemmy](https://github.com/LemmyNet/lemmy)
* Lemmy ansible playbook: [docker-compose.yml](https://github.com/LemmyNet/lemmy-ansible/blob/main/templates/docker-compose.yml)
* Lemmy troubleshooting: [administration/troubleshooting](https://join-lemmy.org/docs/administration/troubleshooting.html)

### General Docs
* Postgres docker user: [postgres#arbitrary user nodes](https://github.com/docker-library/docs/tree/master/postgres#arbitrary---user-notes)
