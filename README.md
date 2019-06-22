Chitter Challenge
=================
[![Build Status](https://travis-ci.org/Danielandro/chitter-challenge.svg?branch=master)](https://travis-ci.org/Danielandro/chitter-challenge)

Makers week 4 challenge

Write a small Twitter clone that will allow the users to post messages to a public stream.

Instructions
------------

Clone the repo 

Run `bundle` to install dependencies

Setup database:
1. Connect to psql

Run `rackup` to start the app at `localhost:9292`

Setup test database:
1. Connect to psql
2. Create the database using the psql command `CREATE DATABASE chitter;`
3. Connect to the database using the command `\c chitter;`
4. Run the query saved in `01_create_peep_table.sql`

User Stories
------------

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

Technical Approach:
-----

#### File Structure
``` 
html

├── Gemfile
├── README.md
├── app
│    ├── controllers
│    │       └── app.rb
│    ├── models
│    │       └── model.rb
│    └── views
|            └── peeps
│                  └── new.erb
├── config.ru
├── public
│      └── stylesheets
└── spec    
    ├── features
    ├── units
    └── spec_helper.rb

```
This week you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

