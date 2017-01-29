# Chitter Challenge

[![Build Status](https://travis-ci.org/dylanrhodius/chitter-challenge.svg?branch=master)](https://travis-ci.org/dylanrhodius/chitter-challenge) [![Coverage Status](https://coveralls.io/repos/github/dylanrhodius/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/dylanrhodius/chitter-challenge?branch=master)

## The Task
This weekend's challenge was to create a Twitter-like website.
The website's homepage contains the latest 'peeps', also showing their respective author (username) and the time it was posted. The app allows users to sign up to Chitter with their e-mail, a password, name, and username. All the data is saved in a database and users' e-mails and usernames must be unique. Users do not need to be logged in to view the latest peeps but must be logged in if they want to peep.

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

[Link to Makers Academy's instructions](https://github.com/dylanrhodius/chitter-challenge/blob/master/MA_Instructions.md)

## Installing the APP
Either visit https://chitter-challenge-dr.herokuapp.com/chitter.
Or clone the repository from: [GitHub](https://github.com/dylanrhodius/chitter-challenge) and then move into that repository.

```
$ git clone git@github.com:dylanrhodius/chitter-challenge.git
$ cd chitter-challenge
```

Load dependencies with bundle
```
$ gem install bundle
$ bundle install
```
Create local databases:
```
$ psql
$ create database chitter_challenge_test;
$ create database chitter_challenge_development;
```

## Using the APP
Load the app in IRB
```
$ irb
$ ruby app/app.rb
```

Open `localhost:4567` in your internet browser.

## Technologies Used
* Ruby 2.3.3.
* Sinatra framework for creating web apps.
* Postgresql databases.
* Object-relational mapping: DataMapper.
* BCrypt to encrypt password in database.
* Deployed to Heroku.

## Further Developments
* Use css/sass/bootstrap to make the interface look much, much better.
* Ability to filter peeps by hashtag topics (#).
* Ability to reply to other users' peeps.


## Contributors
Used some of my colleague's GitHub repos for code references:

* Mitchell Goldbay [github](https://github.com/mbgimot/)
