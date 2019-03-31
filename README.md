# Chitter Challenge

[![Build Status](https://travis-ci.org/amyj0rdan/chitter-challenge.svg?branch=master)](https://travis-ci.org/amyj0rdan/chitter-challenge)

[Getting started](#getting-started) | [Usage](#Usage) | [Running tests](#running-tests)

[User stories](#user-stories) | [Areas for development](#Areas-for-development)

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

### To create the databases

Connect to `psql` and create the `chitter` and `chitter_test` databases:

```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```

### To set up the appropriate tables

Connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

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

## Areas for development
- Username and email address are not unique
  * Currently there can be two users with the same email address and same handle
  * Need to spend some time researching how is best to do this in PSQL/Sinatra - could possibly adapt/use the `User.find` method that is already implemented
- Peeps have the name of the maker and their user handle
  * Many-to-many relationship so would need to create a join table for peeps that combines Peep IDs and User IDs
- Advanced user story: tagging and sending emails to users
- Better testing of edge cases (eg, someone tries to add a peep with an apostrophe)
- I ran out of time a bit on this task so my application is very ugly - I would have liked to add some CSS.
