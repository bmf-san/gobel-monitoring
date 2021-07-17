.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

.PHONY: Build containers
docker-compose-build: ## Build containers by docker compose.
	docker-compose build

.PHONY: Run containers
docker-compose-up: ## Run containers by docker-compose.
	docker-compose up --no-deps -d