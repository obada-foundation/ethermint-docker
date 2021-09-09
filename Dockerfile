FROM alpine:edge AS builder

RUN apk update && apk upgrade

RUN apk add --no-cache go gcc g++ musl-dev linux-headers  make git

RUN git clone https://github.com/tharsis/ethermint && cd ethermint  &&  make

FROM alpine:latest

RUN apk --no-cache add ca-certificates && adduser ethermint -D

USER ethermint

WORKDIR /home/ethermint

COPY --chmod=+x --chown=ethermint --from=builder ethermint/build/ethermintd .

CMD ["./ethermintd"]
