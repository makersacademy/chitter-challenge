Chitter Challenge
=================

Challenge:
-------

Write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
USER_STORIES

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

Setup:
-------

To implement this app you will need to install two databases on your computer. To do this follow these steps: 

1. ### Install gems 
  
   * Discuss missing steps in code review

2. ### Setting up the databases

  * Connect to psql

  * Create the databases using the psql command: CREATE DATABASE chitter;

  * Connect to the production database using the pqsl command: `\c chitter`;

  * Create the cheets table using the psql command: `CREATE TABLE cheets(id SERIAL PRIMARY KEY, posts VARCHAR(60), date VARCHAR(10), time VARCHAR(5));`

  * Create the users table using the psql command: `CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60));`

  * Create a second database named "chitter_test" by repeating the above steps

3. ### Testing 

  * run the command 'rackup' to start the server 

  * visit localhost:9292 to checkout the app ! 
