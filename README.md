Chitter Challenge
=================

Scope of the program:
-------

This program is a small Twitter clone that allows the users to post messages to a public stream.

How to run the program:
-------
<br>$ git clone https://github.com/Brendao1/chitter-challenge
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
COMPLETED

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
PARTIAL


```
## Project Status:
This is a partial solution. I inherited the format private_class_method and, later, some general ideas about layout from a former cohort: https://github.com/makersacademy/chitter-challenge/pull/1013/commits/9c73d68ba3f39531e4ee440c9792ce6ed768e561 Sign_up feature is not complete.

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
