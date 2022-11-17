FROM alpine:latest

ARG TARGETOS
ARG TARGETARCH

ADD build-dir/${TARGETOS}/${TARGETARCH}/minio /usr/bin/minio
ADD build-dir/${TARGETOS}/${TARGETARCH}/mc /usr/bin/mc

RUN chmod 0755 /usr/bin/minio && chmod 0755 /usr/bin/mc && mkdir /data

#ENV MINIO_ACCESS_KEY_FILE=access_key \
#    MINIO_SECRET_KEY_FILE=secret_key \
#    MINIO_ROOT_USER_FILE=access_key \
#    MINIO_ROOT_PASSWORD_FILE=secret_key \
#    MINIO_KMS_SECRET_KEY_FILE=kms_master_key

VOLUME ["/data"]

EXPOSE 9000 9001

#ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

CMD ["/usr/bin/minio", "server", "/data"]
