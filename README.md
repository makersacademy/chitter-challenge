Chitter Challenge
=================

* Author: Mark Hill
* Date created 14/2/2016
* Makers Academy: Week 4 weekend challenge

Description
-------
A simple twitter-like web application that uses databases to store user information and messages.
Users register by clicking on the "sign up" button and entering their name, username, email and password. Users sign in by clicking the "Log in" button and entering their username and password and can then "peep" (send a message).
By clicking on the username next to message, that users message history can be seen.
User passwords are encrypted using Bcrypt.

Technologies used
------
* Ruby
* Sinatra
* DataMapper
* Capybara
* Rspec
* BCrypt

User Stories
---------

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
