Chitter Challenge
=================
[![Build Status](https://travis-ci.org/joestephens/chitter-challenge.svg?branch=master)](https://travis-ci.org/joestephens/chitter-challenge) [![Coverage Status](https://coveralls.io/repos/github/joestephens/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/joestephens/chitter-challenge?branch=master)

Twitter-style messaging application completed for Makers Academy weekend challenge.

Screenshot
-------
![Screenshot](http://i.imgur.com/2I6PASg.png)

User Stories
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

Installation instructions
------
```
git clone https://github.com/joestephens/chitter-challenge.git
bundle
psql
CREATE DATABASE chitter_development;
rake db:auto_migrate
rackup
```

Features
------

* Sign up to chitter with email, password, display name and a user name
* Peeps (posts to chitter) have the name of the maker and the date/time posted
* Passwords encrypted using BCrypt
* Data saved using DataMapper and Postgres
