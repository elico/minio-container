FROM alpine:latest

ARG TARGETOS
ARG TARGETARCH

ADD build-dir/${TARGETOS}/${TARGETARCH}/minio /usr/bin/minio
ADD build-dir/${TARGETOS}/${TARGETARCH}/mc /usr/bin/mc
ADD start.sh /start.sh

RUN chmod 0755 /usr/bin/minio && chmod 0755 /usr/bin/mc && chmod 0755 /start.sh && mkdir /data

#ENV MINIO_ROOT_USER_FILE=access_key \
#    MINIO_ROOT_PASSWORD_FILE=secret_key 

VOLUME ["/data"]

EXPOSE 9000 9001

CMD ["/bin/sh", "/start.sh"]
