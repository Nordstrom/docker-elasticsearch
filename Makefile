image_name     ?= elasticsearch
image_registry := quay.io/nordstrom
image_release  := 5.3.1

.PHONY: build/image tag/image push/image

build/image:
	docker build \
		--build-arg "PROXY_HOST=$(proxy_host)" \
		--build-arg "PROXY_PORT=$(proxy_port)" \
		--tag $(image_name) $(image_name)/

tag/image: build/image
	docker tag $(image_name) $(image_registry)/$(image_name):$(image_release)

push/image: tag/image
	docker push $(image_registry)/$(image_name):$(image_release)
