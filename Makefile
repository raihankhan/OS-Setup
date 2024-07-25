DOCKER_REGISTRY       := "ghcr.io"
DOCKER_REPOSITORY     := "raihankhan"
ADDLICENSE_DOCKER_TAG := "v1.1.2"
LICENSE_AUTHOR        := "Raihan Khan"
LICENSE_TYPE          := "apache"

add-license:
	@docker run --rm -it -v $(PWD):/src $(DOCKER_REGISTRY)/$(DOCKER_REPOSITORY)/addlicense:$(ADDLICENSE_DOCKER_TAG) -c $(LICENSE_AUTHOR) -l $(LICENSE_TYPE) -v *.sh

check-license:
	@docker run --rm -it -v $(PWD):/src $(DOCKER_REGISTRY)/$(DOCKER_REPOSITORY)/addlicense:$(ADDLICENSE_DOCKER_TAG) -check -v *.sh