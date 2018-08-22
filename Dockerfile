#FROM golang:1.10-alpine as builder
FROM golang:stretch as builder

MAINTAINER Lee Nelson lnelson@nelnet.org github.com/nelsonov

ENV GOPATH /go
ENV PATH /go/bin:$PATH
#RUN apk add build-base git && \
RUN apt-get update && apt-get install -yy golang git && \
    go get -v github.com/magefile/mage && \
    go get -v -d github.com/gohugoio/hugo && \
    cd ${GOPATH}/src/github.com/gohugoio/hugo && \
    mage -v vendor && \
    HUGO_BUILD_TAGS=extended mage -v install


FROM debian:latest as hugo

COPY --from=builder /go/bin/hugo /go/bin/hugo
ENV GOPATH /go
ENV PATH /go/bin:$PATH
ENV SRCPATH /workspace

#ENTRYPOINT ["sh", "-c", "hugo -s $SRCPATH"]
