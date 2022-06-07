#!/bin/bash

#######################################################################
# Requisitos:
# - docker                                                            #
# - docker.io
#                                                                     #
#
# Uso: ./vscodeserverdocker.sh <contraseña_de_acceso> <puerto>        #
#
#  Ejemplo: ./vscodeserverdocker.sh password 8080                     #
#######################################################################

mkdir -p ~/.config
docker run -itd --name code-server \
 -p $2:8080 \
-v "$HOME/.config:/home/coder/.config" \
-e PASSWORD=$1 \
-v "$PWD:/home/coder/project" \
 -u "$(id -u):$(id -g)" \
 -e "DOCKER_USER=$USER" \
codercom/code-server:latest
