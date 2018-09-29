# Chitter Challenge

## Overview

To create an alternative version of Twitter called `Chitter`.

A posted message is called a `peep`.

`Peeps` are displayed in reverse chronological order.

`Peeps` are displayed with the username of the user that created it and the date and time that it was created.

A `user` can sign up, log in and create a `peep`, and log out.

To sign up, a `user` must have a unique email and username, a name and a password.

A `user` does not have to be logged in to see `peeps`.

## Set up

To run the application:

- `git clone git@github.com:jonurry/chitter-challenge.git` to clone the repository

- `bundle install` to install dependencies

- `rspec` to run all feature and unit tests tests

- `rubocop` to check for code styling issues

- `brew install postgres` to install PostgreSQL

  - `psql` to launch postgresql

  - `create database chitter` to create the production database

  - `create database chitter_test` to create the test database

  - `\q' to exit psql

- `rerun 'rackup'` to launch the web server

- navigate to `http://localhost:9292/` to run the application in a web browser

## Technologies Used

- `rspec` for automated testing

- `sinatra` for the web server

- `capybara` for automating feature tests in the browser

- `rake` for automating tasks

- `rerun` for automatically re-starting the web server when code files are changed

- `rubocop` for checking code style issues

- `simplecov` for getting metrics on code coverage for the tests

- `postgresql` to connect to and query the database

## Process

## Class Design

![Chitter UML Class Diagram](docs/chitter-class-diagram.jpg)

## Routes

- `'/'` redirects to `'/peeps/all'`

- `'/peeps/all'` displays all peeps in reverse chronological order

- `'/peeps/create'` creates a peep message

- `'/user/create'` creates a Chitter user

- `'/user/login'` allows the user to login to Chitter

## User Interface Design

### Header (user not logged in)

![Header when user is logged out](docs/header-logged-out.jpg)

### Header (user not logged in)

![Header when user is logged in](docs/header-logged-in.png)

### User Log In

![Log in](docs/log-in.jpg)

### Create a Peep

![Create a peep](docs/create-peep.jpg)

### Display all Peeps

![Display all peeps](docs/display-peeps.jpg)
