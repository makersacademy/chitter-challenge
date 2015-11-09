[![Build Status](https://travis-ci.org/samover/chitter-challenge.svg)](https://travis-ci.org/samover/chitter-challenge)[![Coverage Status](https://coveralls.io/repos/samover/chitter-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/samover/chitter-challenge?branch=master)
Chitter Challenge
=================

The Chitter Challenge is a weekend project for [Makers Academy](http://www.makersacademy.com) that uses Sinatra and Postgresql database (Datamapper) functionality. It consists of creating a little Twitter clone that will allow the users to post messages to a public stream.

Here is a [working example](https://badass-chitter.herokuapp.com/).

Approach
--------

As usual, the approach is test driven (see requested [features](#features)) using Rspec and Capybara. It follows a rigidly Red-Green-Refactor cycle to keep the codebase DRY and strive for a MVP. Following sound design principles, Sinatra is set up in modular style.

Most work went into implementing a user management system with password encryption (BCrypt). As it stands, users can sign up, log in, sign out and request a password reset. The sending of an email token still has to be implemented.

This is the first time I did some front end, so the eyecandy is basically fit for a laptop screen. Smaller or bigger screens are not very happy :-)

The technologies used are:

* [Datamapper](https://github.com/datamapper) # postgresql database for ruby
* [BCrypt](https://github.com/codahale/bcrypt-ruby) # keeping passwords secure
* [DatabaseCleaner](https://github.com/DatabaseCleaner) # cleaning database for test environment
* [Sinatra](http://www.sinatrarb.com/) # Fly me to the moon and let me play among the stars
* [Time Ago in Words](https://github.com/elgalu/time_ago_in_words) # makes timestamps readable


Features
---------

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

As a Maker
So that I can indulge in setting horrible passwords and forgetting them
I want to be able to reset my password
```

Installation
-----------

Here is a [working example](https://badass-chitter.herokuapp.com/).

Install as follows: 

```sh
# clone the project
$ git clone https://github.com/samover/chitter-challenge

# install all the required gems
$ bundle

# create development and test databases
$ createdb chitter_development
$ createdb chitter_test

# setup the databases
$ rake db:dm_migrate
$ rake db:dm_migrate RACK_ENV=test

# check if everything is working fine
$ rspec

# launch the app and visit http://localhost:9292
$ rackup
```
