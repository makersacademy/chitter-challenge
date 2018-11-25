Chitter Challenge
=================

## Setup
* If you haven't got PostgreSQL installed `$ brew install posgresql`
* Connect to psql and create `chitter` and `chitter_test` databases.
* Create the databases using the psql commands `CREATE DATABASE chitter;` and `CREATE DATABASE chitter_test;`
* To set up the appropriate tables, connect to each database in psql and run the SQL scripts in the db/migrations folder in the given order.

## How To Run
`bundle`  
`rackup`  
`http://localhost:9292/`  

## User Stories Implemented
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
