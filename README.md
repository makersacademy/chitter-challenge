


Chitter Challenge [![Build Status](https://travis-ci.org/AlinaGoaga/chitter-challenge.svg?branch=master)](https://travis-ci.org/AlinaGoaga/chitter-challenge)
=================

Features:
-------

```
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

As a Maker
So that I can start a conversation
I want to reply to a peep from another Maker

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Technical Approach:
-----

This application is built in Rails and uses Active Record to interact with the database. 
Devise was implemented to handle user management (sign up, in, out)

Notes on functionality:
------

* All users can see all peeps (regardless of them having signed up or being loged in).
* Makers sign up to chitter with their email, password, name and username.
* Both username and email have to be unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.


Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on test coverage
----------------------

Rubocop is flagging long lines in Rails and Devise generated files. These have not been updated.
