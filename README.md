Makers week 4: Chitter Challenge
=================
[![Build Status](https://travis-ci.org/innlouvate/chitter-challenge.svg?branch=master)](https://travis-ci.org/innlouvate/chitter-challenge)

Task:
-------

Create a little Twitter clone that will allow the users to post messages to a public stream.

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

* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the username of the maker and the time of the post.
* Bcrypt is used to secure the passwords.
* Data mapper and postgres are used to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* A user can reset their password (functionality not fully implemented - still to add token emailing)


To download & install
---------

```sh
$ git clone git@github.com:innlouvate/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ rackup
```
visit localhost/9292 in web browser


Contributors
-------------
[Lou Franklin](https://github.com/innlouvate)
