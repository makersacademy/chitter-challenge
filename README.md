Chitter Challenge
=================

A twitter clone that allows users to post messages to a public stream.

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

Notes on functionality:
------

* Users sign up to chitter with their email, password, name and a user name.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Bcrypt used to secure the passwords.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

How to use:
------

* Visit https://chitter-vivien.herokuapp.com/
* Sign up 
* Write peeps

How to download and run tests:
------

```
git clone https://github.com/honjintang/chitter_challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```


