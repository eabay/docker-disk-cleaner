IMAGE_TAG=mc2labs/disk-cleaner
MIN_FREE_SPACE=10000

run:
	sudo docker run \
        -it \
        --rm \
        -v $(PWD):/app \
        -v /tmp:/data \
        -e DELETE_COUNT=5 \
        -e DELAY_TIME=60 \
        -e MIN_FREE_SPACE=$(MIN_FREE_SPACE) \
        debian:wheezy bash

build:
	sudo docker build -t $(IMAGE_TAG) .

push:
	sudo docker push $(IMAGE_TAG)

.PHONY: run build push
