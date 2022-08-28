FROM golang:1.17.7-alpine3.15 AS builder
ARG GIT_URL=https://github.com/ssb-ngi-pointer/go-ssb-room.git
ARG GIT_TAG=v2.0.6

RUN apk add --no-cache build-base git sqlite-dev

WORKDIR /usr/src/app

RUN git clone ${GIT_URL} --branch ${GIT_TAG} --depth 1 --single-branch . \
 && go install -v github.com/ssb-ngi-pointer/go-ssb-room/v2/cmd/... \
 && strip -s /go/bin/*

FROM alpine:3.15

RUN apk add --no-cache expect pwgen sqlite \
 && adduser -h /home/ssb --disabled-password ssb

COPY --from=builder /go/bin/server /usr/bin/server
COPY --from=builder /go/bin/insert-user /usr/bin/insert-user

USER ssb
WORKDIR /home/ssb

COPY --chown=ssb start.sh /home/ssb/
COPY --chown=ssb init-admin.expect /home/ssb/
RUN mkdir ssb-go-room

EXPOSE 8008/tcp
EXPOSE 3000/tcp

VOLUME ["/home/ssb/ssb-go-room"]

ENTRYPOINT ["/bin/sh"]
CMD ["/home/ssb/start.sh"]
