ARG MAVEN_IMAGE
FROM $MAVEN_IMAGE
LABEL maintainer="Alberto Oliveira <alberto@stilingue.com.br>"

ARG INSTALL_GCLOUD=false
ARG INSTALL_GCLOUD_EMULATOR=false
ARG INSTALL_DOCKER=false

COPY setup.sh /setup.sh

RUN sh ./setup.sh
