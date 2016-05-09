Chitter Challenge
=================

[![Build Status](https://travis-ci.org/lexiht/chitter-challenge.svg?branch=master)](https://travis-ci.org/lexiht/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/github/makersacademy/chitter-challenge/badge.svg?branch=rjlynch)](https://coveralls.io/github/makersacademy/chitter-challenge?branch=rjlynch)

Try out for yourself :)

https://lexi-chitter-app.herokuapp.com/

Features:
-------

```sh
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

Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!

Code Review

Technology used:
----------------

* Password encryption by [Bcrypt]( https://github.com/codahale/bcrypt-ruby ). 
* Database is managed by [PostgreSQL]( http://www.postgresql.org/ ). 
* The ORM used is [DataMapper]( http://datamapper.org/ ). 
* Deploy to [Heroku]( https://www.heroku.com/ ).

Installation:
-------------

* run `$ git clone https://github.com/lexiht/chitter-challenge.git`
* `gem install bundler` if you don't already have, else run `bundle`
* run local server with `rackup`, check port number and open `localhost:port number` eg. `localhost:4567`

Approach:
---------

* Sign in to peep
* New user go to sign up page
* View as guest
* Users can peep and comment on other people peeps.

Author:
-------

[Lexi Tran](hazukitran@gmail.com)



