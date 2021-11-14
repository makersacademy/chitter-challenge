Chitter Challenge
=================

# How to use database

- Connect to psql
- Create the database using the psql command CREATE DATABASE Chitter;
- Connect to the database using the pqsl command \c Chitter;
- Run this query: CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR (60), created_at TIMESTAMPTZ DEFAULT Now());

For testing...

- Create test database using the psql command CREATE DATABASE Chitter_test;
- Connect to the database using the pqsl command \c Chitter_test;
- Run this query: CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR  (60), created_at TIMESTAMPTZ DEFAULT Now());




Features:
-------

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter       //COMPLETE//

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order  //COMPLETE (No test)//

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made            //COMPLETE//

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


