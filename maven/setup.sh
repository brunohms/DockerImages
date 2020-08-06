#!/bin/sh
if [ -f /etc/debian_version ] ; then
    apt-get update
    apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    if [ "$INSTALL_GCLOUD" = "true" ]; then
        echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
        apt-get update
        apt-get install -y google-cloud-sdk
        if [ "$INSTALL_GCLOUD_EMULATOR" = "true" ]; then
            apt-get install -y google-cloud-sdk-firestore-emulator google-cloud-sdk-pubsub-emulator google-cloud-sdk-datastore-emulator
        fi
    fi
    if [ "$INSTALL_DOCKER" = "true" ]; then
        curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
        apt-get update
        apt-get install -y docker-ce docker-ce-cli containerd.io
    fi
elif [ -f /etc/redhat-release ] ; then
    yum install -y yum-utils
    if [ "$INSTALL_GCLOUD" = "true" ]; then
        printf '[google-cloud-sdk]\nname=Google Cloud SDK\nbaseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg\n       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg\n' | tee -a /etc/yum.repos.d/google-cloud-sdk.repo
        yum install -y google-cloud-sdk
        if [ "$INSTALL_GCLOUD_EMULATOR" = "true" ]; then
            yum install -y google-cloud-sdk-firestore-emulator google-cloud-sdk-pubsub-emulator google-cloud-sdk-datastore-emulator
        fi
    fi
    if [ "$INSTALL_DOCKER" = "true" ]; then
        yum install -y policycoreutils-python
        yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.107-3.el7.noarch.rpm
        yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        yum install -y docker-ce docker-ce-cli containerd.io
    fi
fi
