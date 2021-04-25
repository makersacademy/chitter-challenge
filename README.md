Chitter Challenge - Solution
============================

Requirements
============

The aim of this excercise was to a built a twitter clone with basic functionality. The user stories provided were as follows:

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

How to Use
==========

1. Clone this repository
2. Connect to psql
3. run two commands: CREATE DATABASE chitter; CREATE DATABASE chitter_test;
4. Connect to the databases using the psql commands: \c chitter; \c chitter_test;
5. Run the query listed in the 01_create_users_table.sql file within the db/migrations directory for each db.
6. Run the query listed in the 02_create_peeps_table.sql file within the db/migrations directory for each db.
7. Run rackup
8. open browser to local host 9292 to interact with the app


Tech stack and gems used
========================

The front end of the app has been built using basic html. This is powered by sinatra web framework. Psql has been used as database. Backend has been built in ruby.

The following gems have been used to create this app:

* gem 'capybara'
* gem 'rspec'
* gem 'rubocop'
* gem 'simplecov'
* gem 'simplecov-console'
* gem 'sinatra'
* gem 'sinatra-contrib'
* gem 'sinatra-flash'
* gem 'webrick'
* gem 'rack'
* gem 'pg'

What went well
==============

* Basic functionality was built
* Successful implementation of sign up functionality
* Great insight achieved into building full stack apps


What needs to improve
=====================

* Need to learn html and css in much more detail, current styling is not that great
* Only achieved basic functionality but need to advance it further
* Need to understand the sepeartion of controllers in more detail
* Need to understand authentication process in more detail


Final thoughts
==============

Overall, a very fun challenge to work on and complete.

