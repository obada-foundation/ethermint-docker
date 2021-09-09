IMAGE = obada/ethermint
SHELL := /bin/sh

.DEFAULT_GOAL := build

build:
	docker build -t $(IMAGE) .

publish:
	docker push $(IMAGE)
