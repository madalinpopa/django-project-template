#!/usr/bin/env bash
#
# Set Environments
set -e

if [ ! -f ".env" ]; then

    # Create the .env file
    touch .env

    # General
    echo 'DOCKER_BUILD_ENV="local"' >>.env
    echo 'DOCKERHUB_USERNAME="{{ project_name }}"' >> .env

    echo " " >>.env

    echo "# Django variables"  >>.env
    echo 'DJANGO_SETTINGS_MODULE="{{project_name}}.settings.dev"' >>.env
    echo 'DJANGO_DEBUG="True"' >>.env
    echo "SECRET_KEY=\"$(cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-50} | head -n 1)\"" >>.env

    echo " " >>.env

    echo "# Database variables"  >>.env
    echo 'DB_NAME="{{project_name}}"' >>.env
    echo 'DB_HOST="localhost"' >>.env
    echo 'DB_PASS="abc123"' >>.env
    echo 'DB_USER="{{ project_name }} "' >>.env

fi

# =========================================
# Install node packages
# =========================================
yarn install

# =========================================
# Build docker images
# =========================================
docker compose up
