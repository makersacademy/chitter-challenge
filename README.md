Chitter Challenge
=================
[![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

Brief:
-----
To write a Twitter clone called Chitter, that allows users to post Peeps, available for viewing to the public via a web application.  The user stories must be satisfied.

User Stories:
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

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

How To Run:
-----------
- To view the website online please follow the 'Heroku' link at the top of this README.
- To run the tests please type 'rake' in the application's root folder.
- To launch a local version of the website in your browser please type 'rackup' in the application's root folder and then follow the onscreen instructions.

Testing:
--------
Rspec was used to write all the unit and feature tests for this application.
All tests pass and coverage is 100%.

The tests are as follows:
```
Running RuboCop...
19 files inspected, no offenses detected

Feature - Peeps Database
  lists all peeps

Feature - User Database
  lists all users

Feature - Peeps On Website
  Peep can be added on the website

Feature - User Sign Up On Website
  succeeds with required details
  fails without password confirmation
  fails if email is already registered
  fails if user handle is already registered

Feature - User Sign In On Website
  succeeds with correct credentials
  fails without correct credentials

Feature - User Sign Out On Website
  succeeds while being signed in

Peep
  database is empty
  can be created in the database
  can be retrieved from the database
  can be deleted from the database

User
  database is empty
  can be created in the database
  can be retrieved from the database
  can be deleted from the database

18 examples, 0 failures

Coverage report generated for RSpec. 142/142 LOC (100.0%) covered.
```
