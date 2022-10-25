# Django New Project Template

This is a project template that I use mostly when I start a new Django project.

## Structure and folders

- `project_name`: The project folder
  - `settings`: The settings module separated by environment type
  - `apps`: Django applications
- `requirements`: Requirements separated by environment
- `utility`: A folder which contains differnt scripts, db files, etc.
  - `bootstrap.sh`: A script to generate the `.env` file and start the docker compose
  - `init.sh`: A script used in docker container to start the Django application
  - `sshd_config`: SSHD config for SSH service in docker container
- `webpack`: A folder with Webpack configuration

## Environment variables

I use `python-dotenv` to hold environment variables. Create a new `.env` file
and add the following environment variables:

```
# Django
DJANGO_SETTINGS_MODULE
DOCKER_BUILD_ENV
SECRET_KEY

# Database
DB_NAME
DB_USER
DB_PASS
DB_HOST
DB_PORT
```

Also, you can run `utility/bootstrap.sh` to create an `.env` file. Update the project settings and remove or add environment variables as per your need.

## Use the template

➡️ Start a new project using the following command:

```bash
django-admin startproject --template https://github.com/madalinpopa/django-project-template/archive/master.zip new_django_project .

```

➡️ Update and replace the `project_name` with your project name the following files

- `init.sh`
- `bootstrap.sh`
- `compose.yml`
- `Dockerfile`
