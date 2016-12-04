Chitter Challenge
=================

Challenge:
-------

Here is a Twitter clone that will allow the users to post messages to a public stream.

This is the Makers Academy homework challenge for Week 4.

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

How to use
------

You will need to create two databases in psql: chitter_development and chitter_test
```
$ git clone https://github.com/cjcoops/chitter-challenge
$ bundle install
$ rake auto_migrate
$ rspec
$ rackup
```

To use online visit: https://chitter-makers.herokuapp.com/peeps

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!
