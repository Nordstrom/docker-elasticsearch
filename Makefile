container_name     := elasticsearch
container_registry := quay.io/nordstrom
container_release  := 5.1

.PHONY: build/image tag/image push/image

build/image:
	docker build \
		--build-arg "PROXY_HOST=$(PROXY_HOST)" \
		--build-arg "PROXY_PORT=$(PROXY_PORT)" \
		--tag $(container_name) .

tag/image: build/image
	docker tag $(container_name) $(container_registry)/$(container_name):$(container_release)

push/image: tag/image
	docker push $(container_registry)/$(container_name):$(container_release)
