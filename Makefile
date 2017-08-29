image_name     ?= elasticsearch
image_registry := quay.io/nordstrom
image_release  := 5.5.2

build:
	docker build \
		--build-arg "PROXY_HOST=$(proxy_host)" \
		--build-arg "PROXY_PORT=$(proxy_port)" \
		--tag $(image_name) $(image_name)/

tag: build
	docker tag $(image_name) $(image_registry)/$(image_name):$(image_release)

push: tag
	docker push $(image_registry)/$(image_name):$(image_release)
