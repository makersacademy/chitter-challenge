# Chitter

[![Build Status](https://travis-ci.com/AJ8GH/chitter-challenge.svg?branch=master)](https://travis-ci.com/AJ8GH/chitter-challenge) [![Maintainability](https://api.codeclimate.com/v1/badges/4713133e3a625ac7b613/maintainability)](https://codeclimate.com/github/AJ8GH/chitter-challenge/maintainability)

## Dependencies

### Ruby version

- `2.7.2`

### Gems

- `bcrypt`
- `capybara`
- `coveralls`
- `pg`
- `puma`
- `rack`
- `rake`
- `rspec`
- `rubocop (= 0.79.0)`
- `simplecov`
- `simplecov-console`
- `sinatra`

## Database Setup

Automated setup with rake tasks:
```shell
% rake setup
% rake migrate
```

Full database setup documented in `db/migrations`

## Getting Started

```shell
% git clone git@github:AJ8GH/chitter-challenge.git
% cd chitter-challenge
% Bundle
% rake setup
% rake migrate
% rackup
```

## Running Tests

```shell
rspec
```

## Reflections

### Design and approach

-

### Skills Applied

-

### What to do differently

-

## User Stories

```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
