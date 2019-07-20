##NOTES TO MYSELF
### TO DO:
* Database to record the user's details
* Home page knows if signed in.
* Associate peeps with the user (although this is Harder user story...)
* Make an external style sheet work.

# Chitter - Week 4 Weekend challenge

This is my attempt at the week 4 weekend challenge - [Chitter](https://github.com/makersacademy/chitter-challenge)

###Setup instructions for database
The databases used are PostgreSQL databases and can be setup as follows:

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the query we have saved in the file 01_create_peeps_table.sql

CREATE TEST DATABASE


1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter_test;
3. Connect to the database using the pqsl command \c chitter_test;
4. Run the query we have saved in the file 01_create_peeps_table.sql

## DOMAIN MODEL for the 'Straight Up' User stories
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

###Peep class
Methods:
* .create
* .all
* .get_time
Attributes:
* id
* message
* time
* user

###User
Methods:
* .sign_up
Instance Variable:
* user_name
* password
* peeps
