Chitter Challenge
=================

The purpose of the challenge was to create a clone of Twitter to practice creating a web a application with a database, using Sinatra, PostgreSQL and Ruby.

The user can enter the application and see the messages already published. Clicking on "New message", the user can write a new message and publish it in the board, with a time stamp of when it was written.

Messages on the board are sorted chronologically from newest to oldest.

User stories:
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

From these user stories, there were implemented the first 3 of them.


Getting started:
-----

Run `bundle install` to install all the needed gems
Create databases as detailed below on 'Create Databases section'


Usage:
-----

Run `rackup` on the main folder
Access `localhost:9292/board` in a browser to access the main page


Running tests:
-----

Run `rspec` on main folder


Create Databases:
-----

Chitter database:
1. Connect to `psql`
2. Create database: `CREATE DATABASE chitter;`
3. Connect to chitter database: `\c chitter;`
4. Run query saved in file `01_create_peeps_table.sql`

Chitter test database:
1. Connect to `psql`
2. Create database: `CREATE DATABASE chitter_test;`
3. Connect to chitter database: `\c chitter_test;`
4. Run query saved in file `01_create_peeps_table.sql`
