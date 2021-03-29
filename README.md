Chitter Challenge
=================

How to setup:
-----

* Clone the repo
* Run bundle install
* Run the following SQL commands in PSQL, or otherwise, to setup the databases:
```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
\c chitter;
CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), email VARCHAR(60), password VARCHAR(60));
CREATE TABLE messages(id SERIAL PRIMARY KEY, text VARCHAR(240), time TIMESTAMP, users_id INTEGER REFERENCES users (id));
```
* The following databases are sufficicent for testing, if you would like to create entries on the website, register a user, login and add peeps!
* `rspec` to view tests
* `rackup` to run ruby server when in root directory
* `http://127.0.0.1:9292/` in browser to view app

TODO:
-----

- [x] Plan out web layout with different pages and actions.
- [x] Display all peeps on homepage in reverse order with name, username and time created.
- [x] Sign up - creates a new user --- email and username must be unique!
- [x] User can create peeps.
- [] Enter password in twice to check if entered correctly.
- [] Can sign in with username or email with their password.
- [] Make fields required - also standardise inputs (length of username).

Features:
-------

```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----
If you have time you can implement the following:
* In order to start a conversation as a maker I want to reply to a peep from another maker.
And/Or:
* Work on the CSS to make it look good.
