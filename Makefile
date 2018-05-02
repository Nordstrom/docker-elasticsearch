image_registry := quay.io/nordstrom
image_release := 6.2.4

elasticsearch_image = $(image_registry)/elasticsearch:$(image_release)
kibana_image = $(image_registry)/kibana:$(image_release)

check-var = $(if $(strip $($1)),,$(error var for "$1" is empty!))

elasticsearch/build:
	docker build --tag elasticsearch elasticsearch/

elasticsearch/push:
	$(call check-var,version)
	docker tag elasticsearch $(elasticsearch_image)
	docker push $(elasticsearch_image)
	docker tag elasticsearch $(elasticsearch_image)-$(version)
	docker push $(elasticsearch_image)-$(version)

kibana/build:
	docker build --tag kibana kibana/

kibana/push:
	$(call check-var,version)
	docker tag kibana $(kibana_image)
	docker push $(kibana_image)
	docker tag kibana $(kibana_image)-$(version)
	docker push $(kibana_image)-$(version)
