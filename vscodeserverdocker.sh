#!/bin/bash

mkdir -p ~/.config
docker run -itd --name code-server \
 -p 127.0.0.1:8081:8080 \
-v "$HOME/.config:/home/coder/.config" \
-e PASSWORD=alumno \
-v "$PWD:/home/coder/project" \
 -u "$(id -u):$(id -g)" \
 -e "DOCKER_USER=$USER" \
codercom/code-server:latest
