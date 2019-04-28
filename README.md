#  The Chitter  Challenge.
## Context.
Weekend (Sinatra & Database) Challenge for the fourth week of Makers Academy Course.

## Documents Organisation.  
* The Original README.md file containing the requirements of this challenge is renamed to Challenge_Instruction.md.
* Model: ./lib/
* Views: ./views/
* Controller : app.rb
* Tests: ./spec/

## Development Environment.    
* Language : Ruby
* Library / Domain-specific language:  Sinatra  
* Database / PostgreSQL


## Test Environment.  
* Feature tests : Rspec + Capybara
* Unit test:  Rspec  

## Development Stage:

Covered basic functions for following user stories.  

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


As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

## How to Run.  

### Database set-up

In terminal:

- Run `$ brew install postgresql` to install postgres server
- Run `$ brew services start postgresql` to start the postgres server.
- Run `$ psql` to change into psql terminal
- Run `=#CREATE DATABASE chitter;` to create a new postgres database 'chitter'
- Run `=# \c chitter` to change the path into the database 'chitter'
- Run SQL queries in order in db/migrations folder
- Run `=#CREATE DATABASE chitter_test;` to create a new postgres database 'chitter' for test
- Run `=#\c chitter_test` to change the path into the database 'chitter_test'
- Run SQL queries in order in db/migrations folder

### Run Localhost

In terminal:

- Navigate into project folder 'chitter-challenge'
- Run `$ rackup -p 4567` to start local server on port 4567.

### On browser

- Open a web browser (chrome or firefox etc.)  
- Enter  url `http://localhost:4567/`
- Enter text fields and click buttons to explore the features.  
