Chitter Challenge
==================

[![Build Status](https://travis-ci.org/yyl29/chitter-challenge.svg?branch=master)](https://travis-ci.org/yyl29/chitter-challenge) [![Coverage Status](https://coveralls.io/repos/github/yyl29/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/yyl29/chitter-challenge?branch=master)

deployed to Heroku on https://chittter-chattter.herokuapp.com/

What is it?
------------

This is Week 4 weekend challenge at Makers Academy. It is a simple Twitter clone that will allow the users to post messages to a public stream. Full instructions of the challenge can be found in [INSTRUCTIONS.md](https://github.com/yyl29/chitter-challenge/blob/master/INSTRUCTIONS.md).

Features
---------

* Users can sign up for Chitter
* Users can sign in and sign out
* Users can post a peep while signed in
* Users can view all peeps in reverse chronological order
* Peeps have the names and usernames of the posters
* Peeps have the times at which they were made
* Passwords are secured
* Username and email are unique

Usage
------

First make sure PostgreSQL was installed properly. Then download and run the app in command line:

```
$ git clone https://github.com/yyl29/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ createdb chitter_development
$ rake db:auto_migrate
$ rackup
```

This will create a database named `chitter_development` using Postgres, and run this app on a local web server. You can then peep using a browser at `http://localhost:9292/`.

###Issues and Bug Reports

Feature requests and bug reports can be made here at https://github.com/yyl29/chitter-challenge/issues

Technologies used
------------------

* Capybara/RSpec for TDD
* DataMapper and PostgreSQL to save data
* Bcrypt for password encryption

Online Resources
-----------------

* PostgreSQL Documentation: http://www.postgresql.org/docs/
* Heroku: https://www.heroku.com