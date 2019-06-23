Chitter Challenge
=================

This is my version of the chitter challenge. You can view the original README file [here](https://github.com/makersacademy/chitter-challenge)

Approach
=========

I will create a MVC style website that will fulfil the core user stories below. I will be using PostgreSQL as my RDMS. Setup files will be included to set up the right DB tables. Testing will be done with Capybara and Rspec. Installation instructions are listed below as well.
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

Installation Instructions
==========================

```
$ git clone git@github.com:bengscott2/chitter-challenge.git
$ bundle install
```
Database Setup
===============

* Connect to psql
* Create the database and the testing database using the psql commands:

```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```

* Connect to the database using the pqsl command:

```
 \c chitter;
 \c chitter_test;
 ```

* To set up the appropriate tables, connect to each database in 'psql' and run the SQL scripts in the 'db/migration' folder in the given order.


Startup
========
```
$ rackup
```
In your browser visit http://http://localhost:9292/peeps
