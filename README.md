[![Build Status](https://travis-ci.org/MaryDomashneva/chitter-challenge.svg?branch=master)](https://travis-ci.org/MaryDomashneva/chitter-challenge)

[![codebeat badge](https://codebeat.co/badges/0b8cbc00-81a2-402c-b6e2-4cc28040db6d)](https://codebeat.co/projects/github-com-marydomashneva-chitter-challenge-master)

Chitter Challenge
=================

[Check project online](https://secure-river-72188.herokuapp.com/)

Task:
-------
It is a social media project - simple clone of Twitter.

User Story:
-------

```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Technologies used:
-----
1. ruby 2.5.0
2. sinatra
3. postgre SQL
4. capybara

Run project:
-----

* Clone the progect and type ```bundle install``` in terminal
* Local on your machine: Clone this project, type ```ruby app.rb```
* Onlinel: use this [link](https://secure-river-72188.herokuapp.com/)
* To run tests, type ```rspec```

Result:
-----

The app has two classes:
1. Post. Class Post has following methods:
    * #all - taks from Database all Posts
    * #create - creats a new Post. Posts belongs to user
    * #delete - delets Post
    * #author - returns the author of the Post
2. User. Class User has following methods:
    * #all - takes from Database all Users
    * #create - creates a new User
    * #update - allows to update ```user_name``` and ```email```
    * #find - finds user by id
    * #login - authentication method
    * #unique? - helpers to authentication methods. checkes unique ```user_name``` and ```email```
    * #unique_user_name? - helpers to authentication methods. Would not allowe to create a new User with the ```user_name``` that already exists.
    * #unique_user_email? - helpers to authentication methods. Would not allowe to create a new User with the ```email``` that already exists.
