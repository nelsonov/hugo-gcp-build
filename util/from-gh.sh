mkdir /go
GOPATH=/go
go get github.com/magefile/mage
go get -d github.com/gohugoio/hugo
cd ${GOPATH}/src/github.com/gohugoio/hugo
mage vendor
HUGO_BUILD_TAGS=extended mage install

HUGO=/usr/local/bin/hugo

workdir=/workspace/nelnet-site

${HUGO}

