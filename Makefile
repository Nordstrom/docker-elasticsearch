image_registry := quay.io/nordstrom
image_release := 6.4.1
elasticsearch_image = $(image_registry)/elasticsearch:$(image_release)
kibana_image = $(image_registry)/kibana:$(image_release)
check-var = $(if $(strip $($1)),,$(error var for "$1" is empty!))

default: help

help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[\/a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-26s\033[0m %s\n", $$1, $$2}' Makefile

elasticsearch/build: ## build elasticsearch docker image from Dockerfile on your workstation
	docker build --tag elasticsearch elasticsearch/

elasticsearch/push: ## push and tag elasticsearch docker image to quay
	$(call check-var,version)
	docker tag elasticsearch $(elasticsearch_image)
	docker push $(elasticsearch_image)
	docker tag elasticsearch $(elasticsearch_image)-$(version)
	docker push $(elasticsearch_image)-$(version)

kibana/build: ## build kibana docker image from Dockerfile on your workstation
	docker build --tag kibana kibana/

kibana/push:  ## push and tag docker image to quay
	$(call check-var,version)
	docker tag kibana $(kibana_image)
	docker push $(kibana_image)
	docker tag kibana $(kibana_image)-$(version)
	docker push $(kibana_image)-$(version)
