#!/usr/bin/env bash
#
# Set Environments
set -e

if [ ! -f ".env" ]; then

    # Create the .env file
    touch .env

    # General
    echo 'DOCKER_BUILD_ENV="local"' >>.env
    echo 'DOCKERHUB_USERNAME="project"' >> .env

    echo " " >>.env

    echo "# Django variables"  >>.env
    echo 'DJANGO_SETTINGS_MODULE="project_name.settings.dev"' >>.env
    echo 'DJANGO_DEBUG="True"' >>.env
    echo "SECRET_KEY=\"$(cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-50} | head -n 1)\"" >>.env

    echo " " >>.env

    echo "# Database variables"  >>.env
    echo 'DB_NAME="project_name"' >>.env
    echo 'DB_HOST="db"' >>.env
    echo 'DB_PASS="abc123"' >>.env
    echo 'DB_USER="project"' >>.env

    echo " " >>.env

    echo "# Azure variables"  >>.env
    echo 'AZURE_ACCOUNT_KEY=' >>.env
    echo 'APPLICATIONINSIGHTS_CONNECTION_STRING=' >>.env

    echo " " >>.env

    echo "# Stripe variables"  >>.env
    echo 'STRIPE_PUB_KEY=' >>.env
    echo 'STRIPE_PRIVATE_KEY=' >>.env
    echo 'STRIPE_WEBHOOK_SECRET'= >>.env

    echo " " >>.env

    echo "# Sendinblue variables"  >>.env
    echo 'SENDINBLUE_KEY=' >>.env

    echo " " >>.env

    echo "# Google captcha variables"  >>.env
    echo 'CAPTCHA_PUBLIC_KEY=' >>.env
    echo 'CAPTCHA_PRIVATE_KEY=' >>.env

fi

# =========================================
# Install node packages
# =========================================
yarn install

# =========================================
# Build docker images
# =========================================
docker compose up
