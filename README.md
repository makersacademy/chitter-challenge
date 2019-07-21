# Chitter - Week 4 Weekend challenge

This is my attempt at the week 4 weekend challenge - [Chitter](https://github.com/makersacademy/chitter-challenge)

## Notes for reviewer
A few limitations of my code due to time constraints:
1. The home page takes gives you the option to sign in or log in, so in that sense you cannot post until you done either of these. However, if you went direct to the '/current_session' page you could actually post a peep without an account.

2. There are no tests in place to ensure a username or email address is unique.

3. User is not required to give their name, only a username.

4. Below are the user stories I believe I have fulfilled.

## Approach
I used TDD to tackle the challenge, and the project's high test coverage of 99.55% backs this up.

I also used the 'MVC' model, being 'MODEL-CONTROLLER-VIEW'. My MODEL files are filed under ```lib```, the CONTROLLER is the ```app.rb``` file and the VIEW files are filed under ```views```.

In terms of TDD, I followed the procedure of:

1. Write feature test based on a given user story
2. Get a fail message and write the code to get the test to pass using simplest code possible. If a MODEL is required, then also write a unit test or tests and get this/these to pass, again using the simplest code possible.
3. Repeat 1 and 2 for the next user story.

A local database was used using postgres and instructions to install appropriate databases for testing the program locally are below.

Sinatra was used in order to view the page on a web browser.

## Setup
* After cloning the repository, run ```bundle``` to install the gems.
* Tests can be run using ```rspec```
* Databases will need to be set up as below.
* To view the page locally, using Sinatra, run ```rackup``` in the terminal and then visit ```localhost:``` followed by the port number at the end of the message rackup gives you in the terminal, e.g. '9292'/

### Setup instructions for database
The databases used are PostgreSQL databases and can be setup as follows:

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the queries saved in the following files under ```db/migrations```: 01_create_peeps_table.sql
02_create_users_table.sql
03_add_user_column.sql

TO CREATE TEST DATABASE

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter_test;
3. Connect to the database using the pqsl command \c chitter_test;
4. Run the queries saved in the following files under ```db/migrations```: 01_create_peeps_table.sql
02_create_users_table.sql
03_add_user_column.sql

## User stories the project is based on
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

## My Domain model which I drafted at the start...

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
