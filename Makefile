.PHONY: build run stop tf-plan tf-apply tf-des

IMAGE_NAME = chuck_norris_joke
IMAGE_VERSION = v0.1.0
CONTAINER_NAME = test-container-flask

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) webapp/ 
	
	
run: build
	docker run --rm -p 5000:5000 --name $(CONTAINER_NAME) $(IMAGE_NAME):$(IMAGE_VERSION)


stop:
	docker stop $(CONTAINER_NAME)

tf-init:
	terraform init
	
tf-plan:
	terraform plan -out myplan

tf-apply: tf-plan
	terraform apply "myplan"

tf-des:
	terraform plan -destroy -out destroyplan
	terraform apply "destroyplan"
