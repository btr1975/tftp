# This is for a Docker hub auto build
FROM ubuntu:16.04

LABEL maintainer="e_ben_75-python@yahoo.com" \
      description="This is a tftpd server container" \
      package-name="tftp" \
      image-version="1.0"

RUN apt-get update && apt-get install -y tftpd-hpa \
    && apt-get clean \
    && mkdir /tftpboot \
    && chmod -R 777 /tftpboot \
    && chown -R nobody /tftpboot \
    && cp /etc/default/tftpd-hpa /etc/default/tftpd-hpa.orig

COPY ./tftpd-hpa /etc/default/

WORKDIR /tftpboot

ENTRYPOINT ["/etc/init.d/tftpd-hpa", "start"]
