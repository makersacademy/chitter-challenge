Chitter Challenge
=================
Author: Aday Mesa

Challenge written in Ruby.
Test driven with RSpec & Capybara.
Database used has been Postgres.
ORM used has been Data Mapper.

This is the Week 4 - Weekend Challenge, the instructions for which can be found [here] (https://github.com/makersacademy/chitter-challenge).

The challenge is to create a simplified Twitter clone which has signup/login/logout functionality.

The live app can be found online [here] 

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

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Installation:
-------

```
$ git clone https://github.com/adaymesa/chitter-challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```

