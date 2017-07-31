Chitter Challenge
=================

Description:
-------
A little Twitter clone that will allows the users to post messages to a public stream.
Messages can be filtered by user by clicking on their username.

Features:
-------

```

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

Setup:
-------

Easiest: visit http://tobold-chitter.herokuapp.com/peeps

For testing:
```
clone from github
bundle install
psql
CREATE DATABASE chitter-test;
rake migrate database=test
rspec

psql
CREATE DATABASE chitter-development;
rake migrate database=development
rackup
//localhost:9292 (port may differ depending on config)
```
