## Synopsis

Kool Cloud API

This application uses:

- Ruby 2.5.1
- Rails 5.2.0
- PostgreSQL 10.4

## Development Environment

This project uses [Docker](https://www.docker.com/).

To get the project environment up and running locally, you can run:

NOTE: this may take a while the first time it runs.

`$ docker-compose up`

You can now setup the application by running:

`$ docker-compose run web bin/setup`

You can view the `bin/setup` file to see exactly what the above is doing. You should now be able to see the site at:

- http://localhost:3000

### Tests

You can run the test suite with:

`$ docker-compose run web bin/rails test`

## Staging Environment

The staging environment is on Heroku. It is using X,Y,Z add-ons.

- Heroku app: `kool-cloud-api-staging`
- Url: http://staging.myapp.com
- 1Password tag: `koolcloud`

### Deployment

The app uses Heroku pipelines is deployed via continuos integration. You just need to create a new branch, so your work and then create a new PR against `master`. When the PR is merged and if the tests pass, the app will be auto-deployed to staging.

## Production Environment

The production environment is on Heroku. It is using X,Y,Z add-ons.

- Heroku app: `kool-cloud-api-production`
- Url: http://myapp.com
- 1Password tag: `koolcloud`

### Deployment

Production deployment is done by promoting staging.

## Git Workflow

[Kyan GIT Workflow](https://kyan-handbook.herokuapp.com/development/git.html)
