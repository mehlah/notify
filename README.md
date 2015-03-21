# Notify

## Getting Started

This repository comes equipped with a self-setup script to set up your machine
with the necessary dependencies to run and test this app.

It assumes you have a machine equipped with Ruby, Postgres, etc.

    % ./bin/setup

After setting up, you can run the application using [foreman]:

    % foreman start

[foreman]: http://ddollar.github.io/foreman/

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production
