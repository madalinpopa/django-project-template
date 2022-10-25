ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# VARIABLES
TAG=stage
DOCKER_BUILD_ENV=prod
DOCKER_IMAGE=project_name
DJANGO_SETTINGS_MODULE=project_name.settings.dev

# -------------------------------------------------------
# Utilities commands
#--------------------------------------------------------

# Scripts
bootstrap:
	./scripts/bootstrap.sh

# Docker utility commands
kill:
	@docker kill $$(docker ps -q)

rmc:
	@docker rm $$(docker ps -a -q)

rmi:
	@docker rmi $$(docker images -q)

# -------------------------------------------------------
# Container Build and push to Docker
#--------------------------------------------------------
build-dev:
	docker build -t ${DOCKERHUB_USERNAME}/${DOCKER_IMAGE}:dev \
	--target development \
	--network host \
	--build-arg DOCKER_BUILD_ENV=local \
	--build-arg SECRET_KEY=${SECRET_KEY} \
	--build-arg DJANGO_SETTINGS_MODULE=DJANGO_SETTINGS_MODULE \
	--build-arg DB_NAME=${DB_NAME} \
	--build-arg DB_HOST=${DB_HOST} \
	--build-arg DB_PASS=${DB_PASS} \
	--build-arg DB_USER=${DB_USER} .

build-prod:
	docker build -t ${DOCKERHUB_USERNAME}/${DOCKER_IMAGE}:${TAG} \
	--build-arg DOCKER_BUILD_ENV=${DOCKER_BUILD_ENV} .

push:
	docker push ${DOCKERHUB_USERNAME}/${DOCKER_IMAGE}:${TAG}

# -------------------------------------------------------
# Pre-production database setup
#--------------------------------------------------------
makemigrations:
	docker run --rm --network host \
	${DOCKERHUB_USERNAME}/${DOCKER_IMAGE}:dev \
	/bin/bash -c "python manage.py makemigrations && python manage.py migrate"
