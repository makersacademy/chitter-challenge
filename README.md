# Chitter Challenge

[Getting started](#getting-started) | [Usage](#Usage) | [Running tests](#running-tests)

[User stories](#user-stories) | [Approach](#Approach) | [Areas for development](#Areas-for-development)

This is the Week 4 weekend challenge from Makers Academy.

It is a Twitter clone that will allow users to post messages to a public stream.

See [here](https://github.com/makersacademy/chitter-challenge) for the original Makers repo

## Getting started

### To set up the project

```
git clone https://github.com/amyj0rdan/chitter-challenge  
gem install bundle
bundle install
```

### To create the database

Connect to `psql` and create the `chitter` database:

```
CREATE DATABASE chitter;
```

### To set up the appropriate tables

Connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

## Usage

```
ruby app.rb
```
Navigate to `localhost:4567`

Or

```
rackup
```
Navigate to `localhost:9292`

## Running tests

```
rspec
```

## User stories

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
