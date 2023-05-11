# Chitter Challenge
=================

## Challenge:
-------
Made for Maker's Academy Week 4 - Web Applications

My attempt at a small Twitter clone that allows the users to post messages to a public stream, based on the following user stories:
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

## Technical Approach:
-----

This is a Ruby app using the Sinatra framework and PostgreSQL for the database.

I decided to challenge myself to use ActiveRecord ORM as the database interface, rather than writing Model and Repository Classes. It was a definite leap up in difficulty, but I learned a lot! 

I wrote tests with RSpec and Rack-test.


## Installation Instructions 


```
git clone PROJECT URL
bundle install
# database creation:
rake db:setup
# test database creation:
rake db:setup RACK_ENV=test
```

Run RSpec to make sure its working, then go to your localhost in a browser to play around with the app.


## KNOWN ISSUES:

