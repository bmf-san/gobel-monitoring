.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

.PHONY: Build containers
build: ## Build containers by docker-compose.
	docker-compose -f docker-compose.yml build

.PHONY: Run containers
up: ## Run containers by docker-compose.
	docker-compose -f docker-compose.yml up

.PHONY: Run containers in the background
up-d: ## Run containers in the background by docker-compose.
	docker-compose -f docker-compose.yml up -d
