#!/bin/bash

# bash build_pilot.sh registry.baidubce.com/bms/higress:1.0

set -e
# 镜像地址信息
IMAGE=$1
SHELL_FOLDER=$(cd "$(dirname "$0")"; pwd)
CMD_FOLDER=${SHELL_FOLDER}/../../cmd
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o higress ${CMD_FOLDER}/higress/
docker build -f ${SHELL_FOLDER}/Dockerfile.higress -t ${IMAGE} .
docker push ${IMAGE}
rm higress