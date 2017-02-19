# Chitter Challenge

[![Build Status](https://travis-ci.org/aabolade/chitter-challenge.svg?branch=master)](https://travis-ci.org/bryonywatson1/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/github/bryonywatson1/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/bryonywatson1/chitter-challenge?branch=master)


Twitter clone which lets users post messages to a public page.

Features
========
* Users can sign up with an email, username and password

* Users can log in

* Users can create a post (or peep).

* Users can log out

* All users can view all of the posts on the 'peeps' page.

* Only users that are logged in can create a post.

* Users can see the time at which a post was made


Approach and Technologies used
==============================

* Written in Ruby.

* Feature testing using Capybara, unit testing using RSpec.

* Datamapper ORM to store instances of User and Peep, the two classes as tables.

* Database cleaner wipes the tables after each test is run

* Sinatra to run and host the local server.

* BCrypt to encrypt the user's password before it is stored in the database.

* RACK switches the database depending whether the application is run in the development or test environment.

Instructions and Installation
=============================

* Fork and clone this repo
* in the command prompt run the following:

```
$ bundle install
```

* YCreate two databases using PostgreSQL as follows:

```
$ psql

=# CREATE DATABASE chitter_test;
=# CREATE DATABASE chitter_development;
```

* To run the application enter:

```
$ rackup
```

* Then visit http://localhost:4567 (please note the last four digits of the url will depend on which port Sinatra uses. You can check this in the terminal when you run the command.)

