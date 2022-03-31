VER=0.4

# Must be LOWERCASE
USER=8ch9azbsfifz
REPO=cw-ringtone-ios
TAG=docker.pkg.github.com/${USER}/${REPO}/cw-ringtone-ios

build:
	docker build . -t ${TAG}:${VER} -t ${TAG}:latest

build_multi:
	docker buildx build --platform linux/amd64,linux/arm64 --push -t ${TAG}:${VER} .
	#docker buildx build --platform linux/amd64,linux/arm64,linux/i386,linux/arm/v7 --push -t ${TAG}:${VER} .

run:
	docker run -it -v $(shell pwd)/data:/data ${TAG}:${VER} bash

push:
	docker push ${TAG}:${VER}
