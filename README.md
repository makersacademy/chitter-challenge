Chitter Challenge
=================
I worked on creating a little Twitter clone which posts "peeps" to a public stream.
You can sign up and see what it looks like [here](https://chitter-euge.herokuapp.com/users/new)

Features:
-------
- [x] Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
- [x] The username and email are unique.
- [x] Peeps (posts to chitter) have the name of the maker and their user handle.
- [x] Uses bcrypt to secure the passwords.
- [x] Uses data mapper and postgres to save the data.
- [x] You don't have to be logged in to see the peeps.
- [x] You only can peep if you are logged in.


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
----------------------
```
$ git clone https://github.com/eugeniaguerrero/chitter-challenge
$ bundle
$ bundle update
$ rake auto_migrate
$ rspec
```
You will need to create two databases with psql:
```
$ psql
$ CREATE DATABASE chitter_test
$ CREATE DATABASE chitter_development

```
To run with rackup:
```
$ rackup -p 4567
```


This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.
