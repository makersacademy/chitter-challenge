[![Build Status](https://travis-ci.org/KPobeeNorris/chitter-challenge.svg?branch=master)](https://travis-ci.org/KPobeeNorris/chitter-challenge)

Chitter Challenge
=================
-------

Environment setup
-------

Git clone: https://github.com/KPobeeNorris/chitter-challenge.git

Run 'bundle'
Build uses Ruby, Sinatra, Datamapper and BCrypt.  Testing is based on Capybara and rspec.

The challenge
-------

This challenge is to recreate a (small) version of Twitter, called Chitter.

The user stories below are used to shape the project:
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

Notes:

On my local machine all tests are passing, but the travis-ci build fails, and appears to be due to two failing tests.  It is not known at present why this is happening.

In addition to this, the challenge is only partially completed at time of submitting my pull request and further work will need to be done. 
