Chitter-Challenge
==================

This is a solution to a challenge given by Makers Academy on week 4, part of Learn to code in 12 weeks course.

The aim of the challenge We are going to write a little Twitter clone that will allow the users to post messages to a public stream.


Technologies used
-----------------

  * Database
    * DataMapper to interact between Ruby and PostgreSQL
    * Rake

  * Framework
    * Sinatra

  * Testing
    * Rspec
    * Capybara

  * External gems
    * bcrypt
    * timecop
    * database_cleaner


Functionalities requested
-------------------------

-  Drive the creation of your app using tests - either cucumber or rspec as you prefer.

-  Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).

-  The username and email are unique.

-  Peeps (posts to chitter) have the name of the maker and their user handle.

-  Use bcrypt to secure the passwords.

-  Use data mapper and postgres to save the data.

-  You don't have to be logged in to see the peeps.

-  You only can peep if you are logged in.


Setting up testing and development environments
------------------------------------------------

In order to play around with this app you need to clone the repo shown below and execute the following commands to be complete functional.

```sh
$ git clone git@github.com:Willibaur/chitter-challenge.git
$ bundle
```

You need to create two databases for test and development environments, I used psql where you can execute

```sh
$ psql
$ create database chitter-test;
$ create database chitter-development;
```

Now you can run a rakefile included in the repo for db admin functionalities

```sh
$ rake auto_migrate                  # For development db purposes
$ rake auto_migrate RACK_ENV=test    # For testing db purposes
```

For inspecting all tests written previously you need to run

```sh
$ rspec
```

Lastly, if you want to run a development environment for which I used rackup, you only need to run

```sh
$ rackup
```

Web access application
-----------------------

[![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

This app was deployed to the web thanks to Heroku cloud service, it is called:

### [Chitter](http://chitter-willibaur.herokuapp.com)


Contributors
------------

* [William Bautista](https://github.com/Willibaur)
