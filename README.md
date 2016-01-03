Chitter Challenge [![Build Status](https://travis-ci.org/giamir/chitter-challenge.svg?branch=master)](https://travis-ci.org/giamir/chitter-challenge) [![Coverage Status](https://coveralls.io/repos/giamir/chitter-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/giamir/chitter-challenge?branch=master)
=================

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

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

Screenshot
----------
![Alt text](screenshot.jpg 'screenshot app')

Installation
------------
You can try the app remotely:
>[https://chitter-giamir.herokuapp.com](https://chitter-giamir.herokuapp.com)

or install it locally:
```
$ git clone git@github.com:giamir/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ createdb chitter_development
$ rake db:migrate
$ rackup
```

Technologies
-------------
- Ruby
- Sinatra
- Postgres
- DataMapper
- Bootstrap


Contributors
-------------
[Giamir Buoncristiani](https://github.com/giamir)
