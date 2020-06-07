.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

MAKEFILE_DIR := $(PWD)

include .env
export

.PHONY: src-build
src-build: ## Build applications from repositories.
	cd ${WORKDIR_GOBEL_API}; GOOS=linux GOARCH=amd64 go build -o ${MAKEFILE_DIR}/gobel-api/gobel-api; \
	cd ${WORKDIR_GOBEL_CLIENT_EXAMPLE}; GOOS=linux GOARCH=amd64 go build -o ${MAKEFILE_DIR}/gobel-client-example/gobel-client-example; \
	cd ${WORKDIR_GOBEL_ADMIN_CLIENT_EXAMPLE}; GOOS=linux GOARCH=amd64 go build -o ${MAKEFILE_DIR}/gobel-admin-client/gobel-admin-client; \
	cp -r ${WORKDIR_GOBEL_CLIENT_EXAMPLE}/view ${MAKEFILE_DIR}/gobel-client-example; \
	cp -r ${WORKDIR_GOBEL_ADMIN_CLIENT_EXAMPLE}/view ${MAKEFILE_DIR}/gobel-admin-client; \

.PHONY: src-build
build: ## Build containers by docker-compose.
	docker-compose -f docker-compose.yml build

.PHONY: src-build
up: ## Run containers by docker-compose.
	docker-compose -f docker-compose.yml up

.PHONY: src-build
up-d: ## Run containers in the background by docker-compose.
	docker-compose -f docker-compose.yml up -d
