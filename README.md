Chitter Challenge
=================
[![Build Status](https://travis-ci.org/richgeog/chitter-challenge.svg)](https://travis-ci.org/richgeog/chitter-challenge) [![Test Coverage](https://codeclimate.com/github/richgeog/chitter-challenge/badges/coverage.svg)](https://codeclimate.com/github/richgeog/chitter-challenge/coverage) [![Code Climate](https://codeclimate.com/github/richgeog/chitter-challenge/badges/gpa.svg)](https://codeclimate.com/github/richgeog/chitter-challenge)

## Task:

Write a little Twitter clone that will allow the users to post messages to a public stream.

## Features:

````
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made


Notes on functionality:
------

* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You do not have to be logged in to see the peeps.
* You only can peep if you are logged in.

Bonus:
-----

* Work on the css to make it look good.
````

## Setup

In terminal:
````
$ brew install postgresql
````

Enter the following lines into the command line:
````
$ ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
$ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
````

type:
````
$ psql
````

Followed by:
````
$ CREATE DATABASE chitter_development;
$ CREATE DATABASE chitter_test;
````

In terminal:
````
$ rackup
````
* Go to localhost:9292

## Testing

````
$ rspec
````

## V1

* Database created
* Welcome page created

## Still to do

* Allow users to sign up with a username and email that is unique
* Allow users to sign in and out once a user has been created
* Allow users to view peeps when they are nit signed in
* Allow users to post peeps on a timeline only when signed in
* Add a timestamp to peeps when they are created
* View all peeps in reverse chronological order
* Allow users to like peeps
* Create associations between peeps, users and likes
* CSS

## Key learnings
