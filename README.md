# Rock, Paper, Scissors Challenge

[![Build Status](https://travis-ci.org/lsewilson/chitter-challenge.svg?branch=master)](https://travis-ci.org/lsewilson/chitter-challenge)

Check it out at http://chitter-witter.herokuapp.com/

## Description

The challenge was to develop a little Twitter clone that allows users to sign up and post messages to a public stream.

## Features/User stories

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

## Set Up Instructions
```
$ git clone https://github.com/lsewilson/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ createdb chitter_development
$ createdb chitter_test # to run any test files
$ rake db:auto_migrate
$ rspec
$ rackup # to view on local host
```

Or sign up for an account on the Heroku app: http://chitter-witter.herokuapp.com/
