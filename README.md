[![Build Status](https://travis-ci.org/rkclark/chitter-challenge.svg?branch=master)](https://travis-ci.org/rkclark/chitter-challenge)[![Coverage Status](https://coveralls.io/repos/github/rkclark/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/rkclark/chitter-challenge?branch=master)

Chitter Challenge
=================

Write a little Twitter clone that will allow the users to post messages to a public stream.

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

## Approach

I employed a test-driven approach to create the Chitter web application using the Sinatra framework.

Users are able to sign up with a unique username and email address, their passwords are encrypted and saved as hashes using BCrypt. Once registered, they are able to sign in and post "Peeps".

Peeps are displayed on the homepage in reverse chronological order. For the purposes of the demo site, only the 10 most recent peeps are displayed. Each peep is given a feather icon to bring some visual interest to the page, and is listed with the user's name, username and the time and date of posting.

The app is deployed to Heroku and you [can access the demo here!](https://rkclark-chitter.herokuapp.com/)

### Technologies Used

**Framework**
- Sinatra (modular)

**Testing**
- RSpec
- Capybara

**Database**
- Postgresql
- DataMapper

**Front-end**
- Bootstrap 4
- Sass

## Screenshots

**Homepage**
![Chitter homepage](https://github.com/rkclark/chitter-challenge/blob/master/screenshots/chitter_home.png)

**Register**
![Chitter register](https://github.com/rkclark/chitter-challenge/blob/master/screenshots/chitter_register.png)

**New Peep**
![Chitter Peep](https://github.com/rkclark/chitter-challenge/blob/master/screenshots/chitter_peep.png)
