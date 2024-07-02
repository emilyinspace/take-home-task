.PHONY: build run stop

IMAGE_NAME = chuck_norris_joke
IMAGE_VERSION = v0.1.0
CONTAINER_NAME = test-container-flask

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) . 
	
	
run: build
	docker run --rm -p 5000:5000 --name $(CONTAINER_NAME) $(IMAGE_NAME):$(IMAGE_VERSION)


stop:
	docker stop $(CONTAINER_NAME)


