#!/bin/bash

#Ejemplo de uso de vscodeServer de LinuxServer

#######################################################################
# Requisitos:
# - docker                                                            #
# - docker.io
#                                                                     #
#
# Uso: ./vscodeLinuxServer.sh <contraseña_de_acceso> <puerto>        #
#
#  Ejemplo: ./vscodeserverdocker.sh password 8080                     #
#######################################################################

docker run -d \
  --name=code-server \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e PASSWORD=$1 `#optional` \
  -e HASHED_PASSWORD= `#optional` \
  -e SUDO_PASSWORD=password `#optional` \
  -e SUDO_PASSWORD_HASH= `#optional` \
  -e PROXY_DOMAIN=code-server.my.domain `#optional` \
  -e DEFAULT_WORKSPACE=/config/workspace `#optional` \
  -p $2:8443 \
  -v /path/to/appdata/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/code-server:latest