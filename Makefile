VER=0.3
build:
	docker build . -t cw-ringtone-ios -t asdlfkj31h/cw-ringtone-ios:${VER} -t asdlfkj31h/cw-ringtone-ios:latest


run:
	docker run -it -v $(shell pwd)/data:/data cw-ringtone-ios bash


push:
	docker push asdlfkj31h/cw-ringtone-ios:${VER}
	docker push asdlfkj31h/cw-ringtone-ios:latest

