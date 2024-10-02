FROM golang:1.23.2-alpine

RUN apk add --update --no-cache git make \
    && go get golang.org/x/tools/go/vcs

RUN apk add build-base

COPY . $GOPATH/src/github.com/khulnasoft-lab/goanalyzer

WORKDIR $GOPATH/src/github.com/khulnasoft-lab/goanalyzer

RUN ./scripts/make-install.sh

EXPOSE 8000

CMD ["make", "start"]
