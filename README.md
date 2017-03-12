# Chitter Challenge

[![Build Status](https://travis-ci.org/treborb/chitter-challenge.svg?branch=master)](https://travis-ci.org/treborb/chitter-challenge)
[![codecov](https://codecov.io/gh/treborb/chitter-challenge/branch/master/graph/badge.svg)](https://codecov.io/gh/treborb/chitter-challenge)

## [Makers Academy](http://www.makersacademy.com) - Week 4 - Solo Weekend Challenge

## Technologies
* [Ruby v2.3.3](https://www.ruby-lang.org/en/)
* [Sinatra](http://www.sinatrarb.com/)
* [PostgreSQL](https://www.postgresql.org/)
* [Slim Template](http://slim-lang.com/)
* [Rspec](http://rspec.info/)
* [Capybara](https://github.com/teamcapybara/capybara)

## Jump To
* [User Stories](#user-stories)
* [Installation](#install)
* [Usage](#usage)
* [Implemented Features](#features)
* [Tests](#tests)
* [Heroku Demo](https://robs-chitter.herokuapp.com/)
* [Screenshots](#screenshots)

## The Brief

Write a little Twitter clone that will allow the users to post messages to a public stream.

**Notes on functionality**

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* users sign up to chitter with their email, password, name and a user name (e.g. sam@example.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the user and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

**Bonus**

* In order to start a conversation as a user I want to reply to a peep from another user.

**And/Or**

* Work on the css to make it look good (we all like beautiful things).

## <a name="user-stories">User Stories</a>

```
As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a user
So that I can post messages on Chitter as me
I want to log in to Chitter

As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a user
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a user
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## <a name="install">Installation</a>
```
$ git clone https://github.com/treborb/chitter-challenge.git
$ cd chitter-challenge
$ rvm use 2.3.3 --install --binary --fuzzy
$ gem install bundler
$ bundle
$ createdb chitter_test
$ createdb chitter_development
```
## <a name="usage">Usage</a>

```
$ rackup
$ open http://localhost:9292
```

**You can use the app to perform all of the actions detailed below:**

## <a name="features">Implemented Features</a>

* You can view "Peeps" (posts) and comments on the homepage without logging in
* Click the "Sign up" button and enter some details to sign up
* Once signed up, you will be automatically logged in
* Once logged in, you will be able to post, or comment on a post
* To sign out, click the "Sign out" button
* If you return and want to log in again, click the "Sign in" button and enter your credentials

## <a name="tests">Running the tests</a>
```
$ rspec
```

## <a name="screenshots">Screenshots</a>

![Chitter](https://d541d4157b28d9cb38c5-cf41a704c6c093350fcb8a1fb943b3e5.ssl.cf5.rackcdn.com/github-readme-images/chitter/screenshot.png)
