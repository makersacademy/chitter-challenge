Chitter Challenge
=================

[![Build Status](https://travis-ci.org/alexleesonmill/chitter-challenge.svg?branch=master)](https://travis-ci.org/alexleesonmill/chitter-challenge)

## Completed
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

## TO DO

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

### Current Issues
- Still a bit messy in relation to routes
- Bad styling
- I wanted to get the timestamp to show without microseconds and couldn't find a way to do it
- My table for the peeps is set to VARCHAR which seems to crash when characters like ' or , are in a peep

Notes on functionality:
------

* You don't have to be logged in to see the peeps. - WORKING
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog). - WORKING
* The username and email are unique. - WORKING
* Peeps (posts to chitter) have the name of the maker and their user handle. - WORKING
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

