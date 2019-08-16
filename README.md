Chitter Challenge
=================



### setting up database:

- connect to psql  `psql`
- create database using command `CREATE DATABASE chitter;`
- connect to the database with command `\c messages;`
- run the query from `db/migarations/01...`

### setting up test database:

- connect to psql `psql`
- create database using command `CREATE DATABASE chitter_test;`
- connect to the database with command `\c chitter_test;`
- run the query from `db/migarations/02...`


user stories:
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

