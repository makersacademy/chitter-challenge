Chitter Challenge
=================

Features:
-------

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

To Use
------
PSQL:
CREATE DATABASE chitter_test
CREATE DATABASE chitter_development

Ruby app:
bundle install
rackup

Heroku:
https://chitter-challenge-jmc.herokuapp.com/

Synopsis
--------
Chitter app is a basic emulation of Twitter. It has secure login via BCrypt and allows users to post tweets which are saved to a database.

The code works on three tiers: views, controllers and models.

Evaluation
---------
The project worked well up to refactoring after which the most basic test features ceased to work. Given the tight deadline hours spent trying to resolve this left little time to fine tune or work on CSS etc..
