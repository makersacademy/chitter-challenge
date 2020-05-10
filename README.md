Chitter Challenge
=================

Database Instructions:

Database Set Up:

1. CREATE DATABASE chitter_test;
2. CREATE DATABASE chitter

For both:

3. CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(50), peep VARCHAR(200), dateTime VARCHAR(40));
4. CREATE TABLE profile(id SERIAL PRIMARY KEY, username VARCHAR(60), name VARCHAR(60), email VARCHAR(100),
password VARCHAR(60));


User Stories:
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
