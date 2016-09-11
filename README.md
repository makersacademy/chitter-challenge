Chitter Challenge
=================

How to use the app:
---

$ git clone https://johnnydee8/chitter-challenge.git
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup

$ altirnatevily: https://johnnys-chitter.herokuapp.com

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

Notes:
------

* 100% test coverage
* All required functionalities implemented
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Project uses partials, however no css implemented :-( 
* README complete
