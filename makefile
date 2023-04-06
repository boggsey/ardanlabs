SHELL := /bin/bash

run:
	cd service && go run main.go

VERSION := 1.0

all: service

build:
	docker build \
		-f zarf/docker/Dockerfile \
		-t service-amd64:$(VERSION) \
		--build-arg BUILD_REF=${VERSION} \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		.