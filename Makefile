build:
	docker build . -t cw-ringtone-ios
	docker build . -t asdlfkj31h/cw-ringtone-ios:0.1


run:
	docker run -it -v $(shell pwd)/data:/data cw-ringtone-ios bash


push:
	docker push asdlfkj31h/cw-ringtone-ios:0.1


