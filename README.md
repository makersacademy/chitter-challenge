Chitter Challenge
=================

### What it does
-------
A simple app that allows users to sign in and post messages to a forum.

### How to run it
-------

Clone the repository and run bundle install. 
Follow the database setup in the section below
Run rackup in the terminal.
Go to localhost:9292 in your browser.

### How to run the tests
-------

Clone the repository and run bundle install. 
Follow the database setup in the section below
Run rspec in the terminal

How To Set Up Databases:
-------

psql postgres
CREATE DATABASE peep_manager WITH OWNER student ENCODING 'UTF8';
\q
psql peep_manager
CREATE DATABASE peep_manager_test WITH OWNER student ENCODING 'UTF8';
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(60));
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(240), author VARCHAR(60), timestamp VARCHAR(60));
\q
psql peep_manager_test
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(60));
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(240), author VARCHAR(60), timestamp VARCHAR(60));


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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

Still to add
----------------------

Prevent user from signing up with a already registered email.
Suitable error message (flash alert) if the user enters the password incorrectly
Sending an email for somebody tagged in a peep
Encrypting the passwords
styling and CSS
Allow user to include an apostrophe in their peep.
Validation of email and password complexity
Add a delete peep and edit peep button
Refactoring using a DatabaseConnection Class
Automated tests with travis ci
  
