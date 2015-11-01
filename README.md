[![BuildStatus](https://travis-ci.org/lucetzer/chitter-challenge.svg?branch=master)](https://travis-ci.org/lucetzer/chitter-challenge)
[![CoverageStatus](https://coveralls.io/repos/lucetzer/chitter-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/lucetzer/chitter-challenge?branch=master)

Chitter Challenge
=================

This is week 4 challenge at Makers Academy which is to make a Twitter clone. The app allows users to sign up, sign in, sign out, view and posts message(peeps). It uses bcrypt to secure passwords.

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

Technologies used:
------
* Ruby 2.2.3
* Sinatra framework
* Bcrypt

Database:
* DataMapper
* Psql
* Postgres

Testing:
* RSpec
* Capybara
* Factory Girl
* Database Cleaner

To run this:
------

* Create your local databases
* Run the program from your local host or config your environment URL and push up to your app hosting platform
