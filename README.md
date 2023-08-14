Chitter Challenge
=================

Description
-------

A small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
STRAIGHT UP

Can post a message (peep) to chitter

Shows the time at which the peep was made

All peeps appear in reverse chronological order

Can sign up, log in and log out of Chitter

```

How to use
-------
```
$ git clone https://github.com/Raphael40/chitter-challenge.git
$ cd chitter-challenge
$ bundle install
$ createdb chitter_database_test
$ psql -h 127.0.0.1 chitter_database_test < spec/chitters_table.sql
$ rspec
$ rackup
$ http://localhost:('Port in use')/
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have their user handle.

Technologies
-----

Ruby, sql, sinatra, rackup, RSpec, HTML, BCrypt

Thoughts
-----
First fullstack solo-project, first three user stories fulfulled without too much difficulty but some help required for sign-up and log-in functions. 