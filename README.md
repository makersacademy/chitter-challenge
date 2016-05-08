Chitter Challenge
=================

What is Chitter?
----------------
A little Twitter clone that will allow users to post messages to a public stream.
Write a program with the following user stories:
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

Functionality
-------------
* Makers sign up to chitter with their email, password, name and a user name.
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

Installation Instructions
-------------------------
```
$ git clone https://github.com/GeekG1rl/chitter_challenge
$ bundle
$ create database chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```
Technologies Used
-----------------
* Ruby 2.2.3 
* Rspec 3.3.2
* Sinatra
* Capybara
* PostgreSQL
* DataMapper
* Heroku

Approach and Refactoring
------------------------
* Classes for Peep and User 
* Seperate testing environments for development and production
* No fancy CSS to show off but will fix that with Bootstrap in due time

Author
------
Mara Wanot
