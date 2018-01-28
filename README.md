Chitter Challenge
=================
[![Build Status](https://travis-ci.org/domvernon/chitter-challenge.svg?branch=master)](https://travis-ci.org/domvernon/chitter-challenge)

About:
-------
This is a simple Twitter clone Sinatra modular app. It sits on top of a rack webserver and has a PostgreSQL. The object relational mapper (ORM) is Data Mapper. The user can post peeps (tweets), once they have signed up or logged in. Anyone can view the peeps that other users have posted.

This app has been built from the ground up using a test-driven devlopment approach. Care was taken to consider edge cases in the user model, so that users cannot signup without giving the right amount of information needed.

As this app is more about the technologies used, the app is not much to look at. This could be changed fairly easily if more time was spent on it. Also, the controller and views could be refactored further to make them simpler, making use of Sinatra Partials.

Setup:
-------
To run the project start posting peeps:
1. Clone the repo to your local machine
2. Change into the directory
3. run `bundle`
4. Install PostgreSQL for your system
5. run `ruby setup.rb`, this will set up the test and devlopment databases
6. run `rackup` (you can specify a port by the `-p` flag, this is set as 9292 if no argument is given)
7. Navigate to [localhost:9292](http://localhost:9292)

Alternatively to steps 4-7, have a look at the app on Heroku [here](https://rocky-retreat-68439.herokuapp.com/).

To run the tests:
1. Change into the main directory
2. run 'rspec'

Instructions:
-------
As this is a simple webapp, take a look at the deployed product [here](https://rocky-retreat-68439.herokuapp.com/). Everything is self explanatory.

User Stories:
-------

```
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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
