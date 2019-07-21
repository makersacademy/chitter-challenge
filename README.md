# Chitter - Week 4 Weekend challenge

This is my attempt at the week 4 weekend challenge - [Chitter](https://github.com/makersacademy/chitter-challenge)

## Notes for reviewer
A few limitations of my code due to time constraints:
1. The home page takes gives you the option to sign in or log in, so in that sense you cannot post until you done either of these. However, if you went direct to the '/current_session' page you could actually post a peep without an account.

2. There are no tests in place to ensure a username or email address is unique.

3. User is not required to give their name, only a username.

## Setup
* After cloning the repository, run ```bundle``` to install the gems.
* Tests can be run using ```rspec```
* Datases will need to be set up as below...

### Setup instructions for database
The databases used are PostgreSQL databases and can be setup as follows:

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the query we have saved in the file 01_create_peeps_table.sql
02_create_users_table.sql
03_add_user_column.sql

TO CREATE TEST DATABASE

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter_test;
3. Connect to the database using the pqsl command \c chitter_test;
4. Run the query we have saved in the file 01_create_peeps_table.sql
02_create_users_table.sql
03_add_user_column.sql

## User stories
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

## My Domain model from the start...
### Peep class
Methods:
* .create
* .all
* .get_time
Attributes:
* id
* message
* time
* user

### User class
Methods:
* .register
* .log_in
* .log_out
Attributes:
* user_name
* email_address
* password
