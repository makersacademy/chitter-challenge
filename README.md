# Chitter Challenge

This is a basic Twitter clone that allows a user to sign up, login to their Chitter account and then post peeps to a public stream. Peeps are displayed in reverse chronological order and show the time, user and user handle.

## Installation

1. Clone the repo to local machine
2. Run ```bundle``` to install dependencies
   (ruby '3.0.2', sinatra, sinatra-flash, capybara, webrick, rerun, pg, bcrypt, rspec, simplecov, rubocop)
3. Install PostgreSQL and create databases
  ```
  CREATE DATABASE chitter;
  CREATE DATABASE chitter_test;
  ```
4. Run the sql commands in the db/migrations folder to confiqure database tables
5. Run ```rackup``` to open app in localhost or ```rspec``` to run tests
   
## User Stories

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

