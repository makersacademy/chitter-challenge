Chitter Challenge
=================

Build Badges:
-------
[![Build
Status](https://travis-ci.org/ggwc82/chitter-challenge.svg?branch=master)](https://travis-ci.org/ggwc82/chitter-challenge)
[![Coverage
Status](https://coveralls.io/repos/github/ggwc82/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/ggwc82/chitter-challenge?branch=master)

Implementation:
-------
Chitter challenge was implemented with the complete set of user stories
described below using TDD and RSpec driving the design. The application is built with Ruby and Sinatra, with user
accounts and peeps (in a one-to-many relationship) stored in a Postgresql relational database with DataMapper as
the chosen ORM. The live development web application is hosted by Heroku, and
can be viewed at:

[https://chitter-ggwc82.herokuapp.com/](https://chitter-ggwc82.herokuapp.com/).

Peeps can be viewed by all users, whether signed in or not. In order to peep, a
user must be signed in with a valid account. Users can sign up, sign in and sign
out. Implementation of validations of form input takes place at a rudimentary
level at the view level with HTML5, however more robust methods are enabled at
the model level utilizing DataMapper, which handles a range of authentication of
user credentials.

DataMapper validations for account creation include checking for valid email address
input, duplicates and mismatches between password and confirmation password. For
signing in, users are required to enter both email and password correctly for an
existing account.

Error messages are raised in the above mentioned cases using Sinatra Flash, and user password
encryption is handled by BCrypt. User sign outs are implemented via a DELETE
request, which relies on an MethodOverride function within Rack to provide this
functionality. 


Instructions:
-------








Features:
-------

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
