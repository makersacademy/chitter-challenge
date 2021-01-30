Chitter Challenge
=================

Features:
-------

## Completed

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

## TO DO

```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

### User story domain modelling
https://docs.google.com/document/d/15R7UgXIHnX9UjGrGrpDBOKLwASgSOK_c7NYLtxArv2M/edit

### Domain diagram
![user story 1](/user_story.png)

## How to use

### To set up the database

Connect to `psql` and create the `bookmark_manager` database & the `bookmark_manager_test:` database;

```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```

To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
bundle
```

```
rackup -p 3000
```

To view bookmarks, navigate to `localhost:3000/bookmarks`.

### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```

### Current Issues
- Still a bit messy in relation to routes
- Very simple CSS
- I wanted to get the timestamp to show without microseconds and couldn't find a way to do it
- Characters like ' or , crash my table peeps this is probably to do with the fact it is set to VARCHAR

Notes on functionality:
------

* You don't have to be logged in to see the peeps. - WORKING
* User sign up to chitter with their email, password, name and a username (e.g. sean@makersacademy.com, Password1234, Sean Edwards, sedwards). - WORKING
* The username and email are unique. - WORKING
* Peeps have the name of the user and their user handle. - WORKING
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
