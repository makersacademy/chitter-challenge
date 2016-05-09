[![Build Status](https://travis-ci.org/festinalent3/chitter-challenge.svg?branch=master)](https://travis-ci.org/festinalent3/chitter-challenge) [![Coverage Status](https://coveralls.io/repos/github/festinalent3/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/festinalent3/chitter-challenge?branch=master)


Chitter Challenge
=================

About
-----
Author: Emma Sjöström

This is the fourth individual challenge at Ronin, Makers Academy.


Challenge:
-------

My task was to write a little Twitter clone that will allow the users to post messages to a public stream.
A preview of the app can be found [here.](https://chitter-emma.herokuapp.com/)

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


Instructions
------------

To download and enable:

````
$ git clone git@github.com:festinalent3/chitter-challenge.git
$ cd chitter-challenge
$ bundle
````

To run locally:
````
$ rackup
````

In this project postgres database is used. You will need to set up two local databases:

````
$ psql
$ create database chitter_development
$ create database chitter_test

````

The database is automatically upgraded (see /app/data_mapper_setup.rb:11), but migrations are handled manually from the command line like so:

````
$ rake db:auto_migrate  # will migrate changes to the development database

$ rake db:auto_migrate RACK_ENV=test #will migrate changes to the test database

````

Notes on functionality:
------

* The creation of the app is test driven using Rspec/Capybara
* Users sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) store the name of the user and their user handle to the database.
* bcrypt is used to secure the passwords.
* Data mapper and postgres are used to save the data.
* Users don't have to be logged in to see the peeps.
* Users only can peep if they are logged in.


The project is built using sinatra and the sinatra-partial gem, allowing the following file structure:

```
.
├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── app
│   ├── app.rb
│   ├── controllers
│   │   ├── peeps.rb
│   │   ├── sessions.rb
│   │   └── users.rb
│   ├── data_mapper_setup.rb
│   ├── helpers.rb
│   ├── models
│   │   ├── peep.rb
│   │   └── user.rb
│   ├── public
│   │   ├── css
│   │   │   └── main.css
│   │   └── images
│   │       ├── chitter_bird.png
│   │       └── tree_bark.png
│   ├── server.rb
│   └── views
│       ├── _flash.erb
│       ├── _welcome.erb
│       ├── layout.erb
│       ├── peeps
│       │   ├── latest.erb
│       │   └── new.erb
│       └── users
│           ├── login.erb
│           └── new.erb
├── config.ru
├── coverage
├── disabled.yml
├── docs
│   └── review.md
├── enabled.yml
└── spec
    ├── features
    │   ├── user_creates_a_peep_spec.rb
    │   ├── user_sign_in_spec.rb
    │   ├── user_sign_out_spec.rb
    │   ├── user_sign_up_spec.rb
    │   └── web_helper.rb
    ├── models
    │   └── user_spec.rb
    └── spec_helper.rb

```


Screenshots
-----------

As always, I include a somewhat minimalistic user interface to ease understanding of the application and it's features. Here are some screen shots of the sign up, peep feed and new peep views:

![Screenshot](http://i.imgur.com/okVWHm6.png)

![Screenshot](http://i.imgur.com/d3m1DGm.png)

![Screenshot](http://i.imgur.com/lBoDqUn.png)



Notes on test coverage
----------------------

This repository is using coveralls to ensure great test coverage. To see the current report locally:

```
$ coveralls report
```
