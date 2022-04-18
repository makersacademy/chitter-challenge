# Chitter Challenge

In this project I demonstrate the skills that I've learned in week 4 of the Makers Academy Bootcamp, by building a small Twitter clone that allows the users to post messages to a public stream.

The project demonstrates my ability to:
* Test drive a simple web app with a database
* RESTful routing
* Build my own Object-relational mapping (ORM)

See tech stack section below for details of this

## Feature specifications

As of Monday 18 April 17:09, I have completed the 'straight up' requirements, but not yet the 'harder' or 'advanced' ones.

### STRAIGHT UP
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
```

### HARDER
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

### ADVANCED
```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## Getting started

`git clone https://github.com/almorcrette/chitter-challenge`

Setting up the database:
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter;`
3. Connect to the database using the `qsql` command `\c chitter;`
4. Run the queries saved in the following files:
* `./db/migrations/01_create_peeps_table.sql`
* `./db/migrations/01_create_users_table.sql`

Install dependencies by running `bundle` command on the command line.

## Usage

Start command: `rackup`
Navigate to `http://localhost:9292/users/new`

To add a new peep, go to:
`http://localhost:9292/peeps/new`


## Running tests

`rspec`

Note that you'll need to set up a test database for this. Follow instructions for setting up the database above, but call the database `chitter_test`

## File manifest

See Github: `https://github.com/almorcrette/chitter-challenge`

### Project approach

![](/chitter-plan.png)

### Tech stack

* Ruby
* Rack
* Sinatra
* PostgreSQL
* PG

_For testing_
* RSpec
* Capybara
* Simplecov

_For development_
* Rubocop
