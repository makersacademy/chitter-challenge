Chitter Challenge
=================

[![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

About:
-------
This is Chitter, a Twitter clone designed to mimic the basic functionality of Twitter. Currently the app allows user to sign up, log in/out, and post a peep (tweet). Users can only post a peep if they are logged in. Users cannot sign up with a username or email that has already been taken.

Installation instructions:
-------
* Fork and clone this repo
* Install the bundle gem (`gem install bundle`)
* Run `bundle`
* Install postgresql and follow the instructions
* Create a production and test database in Postgres
* Run `rake db:auto_migrate` and `rake db:auto_migrate RACK_ENV=test` to build your database tables
* Command line `rackup`
* Visit http://localhost:9292/ from any browser

This app is also available [on Heroku](https://chitter-this.herokuapp.com/).

Functionality Requirements:
-------
Chitter was created from the following user stories:

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
