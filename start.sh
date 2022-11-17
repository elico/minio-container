#!/usr/sh

echo "${MINIO_SERVER_ADDRESS} ${MINIO_SERVER_DOMAIN}" >> /etc/hosts

/usr/bin/minio server --address "${MINIO_SERVER_DOMAIN}:9000" --console-address "${MINIO_SERVER_DOMAIN}:9001" /data
