FROM google/cloud-sdk:alpine
RUN apk add --no-cache git make musl-dev go

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

RUN go version

# Instaling appengine
RUN go get google.golang.org/appengine
RUN go install google.golang.org/appengine

RUN gcloud components install app-engine-go

# Instaling npm/nodejs
RUN apk add --update nodejs nodejs-npm
