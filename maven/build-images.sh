#!/bin/bash
for IMAGE in \
maven:3.5.3-jdk-8 \
maven:3.5.3-jdk-8-docker \
maven:3.5.3-jdk-8-gcloud \
maven:3.5.3-jdk-8-gcloud-emulator \
maven:3.5.3-jdk-8-docker-gcloud \
maven:3.5.3-jdk-8-docker-gcloud-emulator \
maven:3.6.1-jdk-11 \
maven:3.6.1-jdk-11-docker \
maven:3.6.1-jdk-11-gcloud \
maven:3.6.1-jdk-11-gcloud-emulator \
maven:3.6.1-jdk-11-docker-gcloud \
maven:3.6.1-jdk-11-docker-gcloud-emulator \
maven:3.6.3-jdk-14 \
maven:3.6.3-jdk-14-docker \
maven:3.6.3-jdk-14-gcloud \
maven:3.6.3-jdk-14-gcloud-emulator \
maven:3.6.3-jdk-14-docker-gcloud \
maven:3.6.3-jdk-14-docker-gcloud-emulator \
; do
    MAVEN_IMAGE=$(echo $IMAGE | sed -e 's#-docker##; s#-gcloud##; s#-emulator##;')
    BUILD_ARGS="-t $IMAGE -t stilingue220220/$IMAGE"
    BUILD_ARGS="$BUILD_ARGS --build-arg MAVEN_IMAGE=$MAVEN_IMAGE"
    if [[ $IMAGE == *"gcloud"* ]]; then
        BUILD_ARGS="$BUILD_ARGS --build-arg INSTALL_GCLOUD=true"
        if [[ $IMAGE == *"gcloud-emulator"* ]]; then
            BUILD_ARGS="$BUILD_ARGS --build-arg INSTALL_GCLOUD_EMULATOR=true"
        fi
    fi
    if [[ $IMAGE == *"docker"* ]]; then
        BUILD_ARGS="$BUILD_ARGS --build-arg INSTALL_DOCKER=true"
    fi
    CMD="docker build $BUILD_ARGS ."
    printf "%s\n%s\n\n" "Building image $IMAGE with command:" "$CMD"
    $CMD
    docker push "stilingue220220/$IMAGE"

    CMD="docker image rm $IMAGE stilingue220220/$IMAGE"
    printf "%s\n%s\n\n" "Removing local image $IMAGE after build with command:" "$CMD"
    $CMD
done
