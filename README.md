Chitter Challenge
=================

Scope of the program:
-------

This program is a small Twitter clone that allows the users to post messages to a public stream.

How to run the program:
-------
<br>$ git clone https://github.com/Brendao1/chitter_challenge
<br>$ cd chitter-challenge
<br>$ bundle
<br>$ rackup
<br>$ Type localhost:9292 into the browser to start

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

```

## How to set up the DEV database
<br>$ psql postgres
<br>$ CREATE DATABASE makers_peeps;
<br>$ \c makers_peeps;
<br>run the query saved in 01_create_bookmarks_table.sql
<br>$ ALTER TABLE peeps ADD COLUMN maker VARCHAR(60);

## How to set up the TEST database
<br>$ psql postgres
<br>$ CREATE DATABASE makers_peeps_test;
<br>$ \c makers_peeps_test;
<br>run the query saved in 01_create_bookmarks_table.sql
<br>$ ALTER TABLE peeps ADD COLUMN maker VARCHAR(60);
