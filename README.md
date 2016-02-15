Chitter Challenge
=================
Author: Arnold Manzano (arnoldmanzano)

This is a twitter clone web application where users can register, post a peep and reply to other user's peeps.

[![Build Status](https://travis-ci.org/arnoldmanzano/chitter-challenge.svg?branch=master)](https://travis-ci.org/arnoldmanzano/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/github/arnoldmanzano/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/arnoldmanzano/chitter-challenge?branch=master)

```sh
$ git clone <repo address>
$ bundle
$ createdb chitter_development; createdb chitter_test
$ rake db:auto_migrate
$ rspec # to test
$ rackup # to run program
```

Screenshots:

![Imgur](http://i.imgur.com/0O9B1KZ.png)


```sh
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

