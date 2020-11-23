Chitter Challenge
=================
[![Build Status](https://travis-ci.com/ralphm10/chitter-challenge.svg?branch=master)](https://travis-ci.com/ralphm10/chitter-challenge)<br>
Challenge:
-------

This challenge, part of the Makers course, involved building a write a small Twitter clone that will allow the users to post messages to a public stream. The user stores are listed below. 

The technologies used were ruby, sinatra, postgreSQL, html, CSS, and the application was tested with capybara and rspec.

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
## Getting started
```
> git clone https://github.com/ralphm10/chitter-challenge
> bundle
```

### Instructions to setup test and production database:
-----

1. Connect to ``` psql```
2. Create the database using ```psql```
```CREATE DATABASE chitter_test;``` or ```CREATE DATABASE chitter;```
3. Connect to the database using the ```psql``` command:
```\c chitter_test;``` or ```\c chitter;```
4. Run the SQL scripts in the 'db/migrations' folder in the given order

### To run locally
```
> rackup
```
Go to <code>localhost:9292</code>

### Running tests
```
> rspec
```
### Additional functionality

* Emails are validated on the front-end, and passwords need to be a minimum of 8 characters 
* The tests include an unsuccesful sign up attempt due to an email or username already being in use
* User receives flash noticications if their password or email is incorrect, as well as for successful sign-in

### Screen Shots of Deployed App


