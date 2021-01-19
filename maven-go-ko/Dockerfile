FROM stilingue220220/maven:3.6.3-jdk-14
# Installing build-utils
RUN apt-get update && apt-get install -y --no-install-recommends make ca-certificates netbase gnupg dirmngr openssh-client g++ gcc pkg-config libc6-dev
RUN rm -rf /var/lib/apt/lists/*
# Installing go
ENV PATH=/usr/local/go/bin:$PATH
ENV GOLANG_VERSION=1.15.6
RUN curl -L "https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz" | tar xzf - -C /usr/local
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
# Installing ko
ENV KO_VERSION=0.7.2
RUN curl -L "https://github.com/google/ko/releases/download/v${KO_VERSION}/ko_${KO_VERSION}_Linux_x86_64.tar.gz" | tar xzf - -C $GOPATH/bin; \
    chmod +x $GOPATH/bin/ko
# Checking java, maven, go and ko versions
RUN java -version
RUN mvn --version
RUN go version
RUN ko version