FROM golang:alpine

MAINTAINER Lee Nelson lnelson@nelnet.org github.com/nelsonov

ENV GOPATH /go

RUN apk add build-base git && \
    go get -v github.com/magefile/mage && \
    go get -v -d github.com/gohugoio/hugo && \
    cd ${GOPATH}/src/github.com/gohugoio/hugo && \
    mage -v vendor && \
    HUGO_BUILD_TAGS=extended mage -v install




RUN /go/bin/hugo version

WORKDIR /workspace/nelnet-site

#CMD ["/go/bin/hugo"]
