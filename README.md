Chitter Challenge
=================

Makers Academy - Week 4 - Weekend Challenge

[![Build Status](https://travis-ci.org/harrim91/chitter-challenge.svg?branch=master)](https://travis-ci.org/harrim91/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/github/harrim91/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/harrim91/chitter-challenge?branch=master)

Challenge:
-------

Chitter - A Twitter clone that will allow the users to post messages to a public stream.

Technology Used:
-------
- Ruby
- Sinatra
- Postgresql
- DataMapper
- RSpec
- Capybara / Selenium Webdriver

Installation:
-------
- Hosted on [Heroku](https://pure-meadow-79496.herokuapp.com/)

To run tests:
- [Install postgresql](https://www.moncefbelyamani.com/how-to-install-postgresql-on-a-mac-with-homebrew-and-lunchy/)
- Clone this repo (`git clone git@github.com:harrim91/chitter-challenge.git`)
- Install dependencies - `bundle install`
- Create test and dev databases - `createdb chitter_test` and `createdb chitter_test`
- Update database schema - `rake db:auto_upgrade` and `rake db:auto_upgrade RACK_ENV=test`
- Run `rspec`

Features:
-------

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a Maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
