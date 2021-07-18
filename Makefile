.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
DEPLOY_DOCKER_MACHINE="go-production-boilerplate"

build=docker-compose build
up=docker-compose up --no-deps -d

.PHONY: Build containers
docker-compose-build: ## Build containers by docker compose.
	@$(build)

.PHONY: Run containers
docker-compose-up: ## Run containers by docker-compose.
	@$(up)

.PHONY: Deploy
deploy: ## Deploy by docker-machine.
	eval $(docker-machine env $DEPLOY_DOCKER_MACHINE)
	@$(build)
	@$(up)
	docker-compose -f docker-compose.prod.yml build --no-cache
	docker-compose -f docker-compose.prod.yml up --force-recreate -d --no-deps --remove-orphans
	eval $(docker-machine env -u)