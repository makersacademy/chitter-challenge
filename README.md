Chitter Challenge
=================

## Makers Week 4 Challenge
For my fourth weekend challenge at [Makers](https://www.makers.tech/) I had the pleasure of making a Twitter clone - allowing users to post messages to a public stream.

Features:
-------

```
STRAIGHT UP

1
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

2
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

3
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

4
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

5
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

6
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

7
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Notes on functionality:
------

* You do not have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.


Bonus:
-----

If  time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.


---
## Installation

1. Clone this repo 
2. Run the command ```gem install bundler``` (if you don't have bundler already)
3. When the installation completes, run ```bundle install```
---
## Database Setup
- Connect to psql
- Create the database using the psql command CREATE DATABASE chitter;
- Connect to the database using the pqsl command \c chitter;
- Run the query saved in the file 01_create_peeps_table.sql
- Run the query saved in the file 02_create_users_table.sql
---
## To Use
- Run ```rackup```
- Visit ```http://localhost:9292/```
- Peep away your day!
---
## To Test

### Test Database Set Up:
- Connect to psql
- Create the database using the psql command CREATE DATABASE chitter_test;
- Connect to the database using the pqsl command \c chitter_test;
- Run the query saved in the file 01_create_peeps_table.sql
- Run the query saved in the file 02_create_users_table.sql
  
## Running Tests

Run ```rspec```