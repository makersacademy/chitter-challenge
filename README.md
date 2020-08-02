Chitter Challenge
=================

Challenge:
-------

This challenge involved building a write a small Twitter clone that will allow the users to post messages to a public stream.

The technologies used were ruby, sinatra, postgres, and the application was tested with capybara and rspec.

Features:
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

Instructions to setup test and production database:
-----

1. Connect to ``` psql```
2. Create the database using ```psql```
```CREATE DATABASE chitter_test;``` or ```CREATE DATABASE chitter;```
3. Connect to the database using the ```psql``` command:
```\c chitter_test;``` or ```\c chitter;```
4. Run the SQL scripts in the 'db/migrations' folder in the given order



Progress and next steps
----------------------
