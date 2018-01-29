## Chitter Challenge

[![Build Status](https://travis-ci.org/alextwilson/chitter-challenge.svg?branch=master)](https://travis-ci.org/alextwilson/chitter-challenge)

A small social network for shouting into the void that attempts to give privacy through obscurity.

## Getting Started

- Clone the repo
- Run bundle
- Create two databases, chitter_test and chitter_development
- Rackup and go to your localhost of choice!

### Required Gems

#### Really Required

- bcrypt
- data_mapper
- dm-postgres-adapter
- dm-timestamps
- dm-validations
- rake
- sinatra
- sinatra-flash

#### Required for Tests

- capybara
- database_cleaner
- orderly
- rspec

## Testing

To run the tests simply run rspec from your project root.

This project was written using only feature tests.

## User Stories

This project was written to the following requirements:

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (Peep) to Chitter

As a Maker
So that I can see what others are saying  
I want to see all Peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a Peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I don't have to worry about imposters
I want to be unable to register an account with an existing email or username

As a Maker
So that I can tell who is saying what
I want to see who made a Peep
```
