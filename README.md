# Chitter Challenge

This project is ongoing and looks to build a simple twitter copy with persistant storage using PostgreSQL.

## User Stories

```
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

## Domain Model Diagram

user->controller:"/"
controller->model:".all"
model->controller:"[messages]"
controller->view:"[messages]"
view->controller:"html"

## How to use

### To set up the project

```
git clone https://github.com/cms718/chitter_challenge
bundle
```

### To set up the database

Connect to `psql` and create the `chitter` and `chitter_test` databases:

```
CREATE DATABASE chitter;
CREATE DATABASE chiter_test;
```

To set up the appropriate tables, connect to the databases in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
rackup
```

To view bookmarks, navigate to `localhost:9292/bookmarks`.

### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```
