Chitter Challenge
=================

This is the Week 4 Ronin Weekend Challenge, the instructions for which can be found [here] (https://github.com/makersacademy/chitter-challenge).

The challenge is to create a simplified Twitter clone which has signup/login/logout functionality.

The live app can be found online [here] (https://chitter-challenge-amy.herokuapp.com/)


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
$ git clone https://github.com/missamynicholson/chitter-challenge
$ bundle
$ createdb chitter_challenge_development
$ rake auto_migrate
$ rspec
$ rackup
```

[![Coverage Status](https://coveralls.io/repos/github/missamynicholson/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/missamynicholson/chitter-challenge?branch=master)

[![Build Status](https://travis-ci.org/missamynicholson/chitter-challenge.svg?branch=master)](https://travis-ci.org/missamynicholson/chitter-challenge)
