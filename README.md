Chitter
=================

Description
-------
A simple Twitter clone using sinatra as the web server framework and PostgreSQL for data storage.

User Stories:
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

## Setting up Database for storing Bookmarks
1. `brew install postgresql`
2. `psql postgres`
3. `CREATE DATABASE "chitter";`
4. `CREATE TABLE posts(id SERIAL PRIMARY KEY, post VARCHAR(280), timestamp TIMESTAMPTZ default current_timestamp);`
5. `CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(100), username VARCHAR(20), email VARCHAR(50), password VARCHAR(25));`

## Setting up a test database
1. `psql postgres`
3. `CREATE DATABASE "chitter_test";`
3. `CREATE TABLE posts(id SERIAL PRIMARY KEY, post VARCHAR(280), timestamp TIMESTAMPTZ default current_timestamp);`
4. `CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(100), username VARCHAR(20), email VARCHAR(50), password VARCHAR(25));`

## Notes

Bit pressed for time so didn't get to finish this. I decided to leave the readme in a bad state so I could focus on doing more of the coding. If I had more time i'd extract a UserManagement class to look after logging in and out and keeping track of who was logged in. I'd add a status column to my users table to keep track of who was signed in or out there. I also wanted to add some error catching for when someone tries to sign in with the wrong username or password (at the moment it just crashes the site!). I also still needed to add the username and name to the peeps.
