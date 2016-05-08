[![Coverage Status](https://coveralls.io/repos/github/tigretoncio/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/tigretoncio/chitter-challenge?branch=master) [![Build Status](https://travis-ci.org/tigretoncio/chitter-challenge.svg?branch=master)](https://travis-ci.org/tigretoncio/chitter-challenge)

Chitter Challenge
=================

Author: Sergio Enrech Trillo


* The app is deployed [here](https://cheeter-challenge-sergio.herokuapp.com)
* If you want to run it locally, fork this repository and follow the instructions:

```sh
git clone https://github.com/tigretoncio/chitter-challenge
cd chitter-challenge
createdb chitter_development
rake db:auto_migrate
bundle
rackup
```

About Chitter:
------

* Users can sign up with their email and usernames.  They are unique to them on first come first served basis
* Peeps can be seen without login
* Users must log in to peep or reply
* All posts are displayed in reverse chronological order.
* A reply is just another peep created when click on the reply link, which automatically starts populating the peep with the @username of the person who we are replying to.


What has been used
------
TEST

* RSpec
* Capybara
* Orderly
* Coveralls
* Orderly

DATABASES

* Database Cleaner
* Postgres

ORM

* DataMapper

MVC

* Sinatra, (modular and with partials)

SECURITY

* BCrypt

CONTINUOUS INTEGRATION

* Travis CI

OTHERS

* Rake



Pending improvements
-------------
* Forgotten password functionality
* Delete posts functionality
* Presentation using bootstrap

