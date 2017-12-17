Chitter Challenge
=================

Challenge:
-------

This week's challenge on the 4th week of Users Academy is to write a little Twitter clone that will allow the users to post messages to a public stream.


Instructions
-----------
Sign up for a new user account at https://chitter-challenge-lan.herokuapp.com/users/new.  
See all peeps at https://chitter-challenge-lan.herokuapp.com/peeps without being logged in.
Features:
-------

```
As a User
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a User
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a User
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a User
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a User
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

Notes on functionality:
------

* The creation of my app has been driven by using rspec tests
* I have used data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* Users sign up to chitter with their email, password, name and a user name
* The username and email are unique.
* Peeps (posts to chitter) have the name of the user and their user handle.
* I have used bcrypt to secure the passwords.
* You only can peep if you are logged in.
