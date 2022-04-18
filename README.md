Chitter Challenge
=================

Task
-------

To write a small Twitter clone that will allow the users to post messages to a public stream.

I approached this challenge by using a test driven approach. I created the unit and feature tests with Rspec and Capybara:

1) Create a domain model and diagram from the user story
2) Create a failing test (red) in Rspec
3) Develop code to result in a passing test (green)
4) Refactor the code and re-test (orange)
5) Once I have A) high coverage, B) passing Rspec tests, C) code that fulfills the user story. I progress to the next user story and repeat steps 1-5

I used the MVC pattern to develop the web application. 

The server is created with Sinatra.

The database was created using PostgreSQL

The password of users are encrypted in the database with the use of 'bcrypt'

## Getting started

1) git clone path-to-repo
2) Install bundler via `gem install bundle` (if you don't have bundler already)
3) Install dependencies via `bundle`

## Test Code

[Follow these instructions to set-up the PostgreSQL test database](#Database-Setup-for-Testing)

Run rspec from the root directory to test the code and check test coverage

## Run

[Follow these instructions to set-up the PostgreSQL database](#Database-Setup)

In the terminal whilst at the root directory, type `rackup` and press enter
Enter the following url into your preferred browser: http://localhost:9292/

## User Stories

STRAIGHT UP

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

# Database Setup

1. Connect to `psql` (it's important to run this command from the root directory of 'chitter-challenge')
2. Create the database using the `psql` command `CREATE DATABASE messages;`
3. Connect to the database using the `pqsl` command `\c messages;`
4. Run the following commands within psql:
   `\i ./db/migrations/01_create_messages_table.sql`
   `\i ./db/migrations/02_add_creation_to_messages.sql`
   `\i ./db/migrations/03_create_users_table.sql`

# Database Setup for Testing

1. Connect to `psql` (it's important to run this command from the root directory of 'chitter-challenge')
2. Create the database using the `psql` command `CREATE DATABASE messages;`
3. Connect to the database using the `pqsl` command `\c messages;`
4. Run the following commands within psql:
   `\i ./db/migrations/01_create_messages_table.sql`
   `\i ./db/migrations/02_add_creation_to_messages.sql`
   `\i ./db/migrations/03_create_users_table.sql`