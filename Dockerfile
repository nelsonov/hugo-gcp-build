FROM golang:alpine

MAINTAINER Lee Nelson lnelson@nelnet.org github.com/nelsonov

ENV GOPATH /go

RUN mkdir $GOPATH && \
    go get github.com/magefile/mage && \
    go get -d github.com/gohugoio/hugo && \
    cd ${GOPATH}/src/github.com/gohugoio/hugo && \
    mage vendor && \
    HUGO_BUILD_TAGS=extended mage install

WORKDIR /workspace/nelnet-site

RUN /usr/local/bin/hugo version

ENTRYPOINT ["/usr/local/bin/hugo"]

cmd "--verbose"


