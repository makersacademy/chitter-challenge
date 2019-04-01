Chitter Challenge
==================

[Placeholder for Travis CI badge]

## I documented my approach in 'kd_approach.md' <---- Please read me! :)
- I documented and explained the processes and approaches I used for this challenge

The app is available here:
[INSERT LINK]

**To improve my project, next time I would like to:**

Next time I come round to looking at this I want to:

- Apply some CSS to improve the look and feel of the Chitter app
- There were requirements for uniqueness and validation of the user input:
  I would like to apply messages to the user if the user input is invalid format or the username, email 
  have already been taken (non-unique)
- I would like to extract the database connection class and wrap the PG functionality within that
- Remove the duplicate functionality of passing in the user_id and username in the 'create' method for a new peep
- Hosting solutions for the app
- Tidy up the SQL scripts
- I want to explore running travis locally :)

## Introduction to the project

This project is part of Week 4 of the Makers Academy 12-week software engineering programme. 

The aim of this project is to build a small Twitter clone called Chitter that will allow the users to post messages to a public stream.

Features:

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

## Motivation: What are my goals for this project?

#### For this challenge, I am specifically targeting the following Makers Academy goals:

- I have a methodical approach to solving problems
- I can debug anything
- I can TDD anything

In order to test my understanding of integrating databases into a web app and verify that I can build a simple web app using an MVC framework, I will build a full-stack app, Chitter.

#### Relating to the above high-level goals, I would like to:

- Document and explain the processes and approaches I used

> This is presented in: 'kd_approach.md'.

Concrete things
- Apply the MVC framework `Sinatra` to build a simple web app
- Apply a wrapper class/adapter to wrap around an object as an interface to a database

Concepts
- Understand MVC frameworks and RESTful routing
- Understand how to integrate a database into an MVC model
- Explore how to host my web app, including the database

Processes
- Use test-driven development to test-drive the app. I would like to apply the use of Capybara for feature testing the user flow.

Behaviours/mindset
- Take a step back to understand how the user journey might work

## Tech/Framework Used

I will be using Capybara testing as it has extensions for RSpec. I will be particularly focusing on feature-testing the user flow for this project.

You can find out more about Capybara here: http://teamcapybara.github.io/capybara/

RSpec will be used as the testing framework.  

>"RSpec is a Behaviour-Driven Development tool for Ruby programmers. BDD is an approach
to software development that combines Test-Driven Development, Domain Driven Design,
and Acceptance Test-Driven Planning. RSpec helps you do the TDD part of that equation,
focusing on the documentation and design aspects of TDD." 

See documentation:
https://relishapp.com/rspec
http://rspec.info/


The MVC framework, `Sinatra` will be used to build a simple web app. Ruby will be used as the programming language and HTML in Sinatra views for the user interface.

For the database, I will be using `PostgreSQL`, an open-source, object-relational database management system (ORDBMS).
https://www.postgresql.org/

As a final step, I will explore options for hosting my web app, including the database.

## Code Style

I used `rubocop` as a guide.

## How to use the app

The app is available here:


I decided to host the app using .... The app was deployed using  ......

## Images/Screenshots

## Getting started

`git clone https://github.com/kimdiep/chitter-challenge.git`

## Running tests

Tests can be run from the root directory using:

`rspec`

* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

## Database Setup

### Creating a Chitter app database

1. Connect to psql in terminal `psql postgres`
2. Enter `CREATE DATABASE "chitter_app";` command to create a new database called chitter_app

### Adding peep_messages table on the Chitter app database

1. Enter `\c chitter_app;` to connect to the database
2. Create `peep_messages` table by running the sql script `01_peep_messages_table.sql`
3. Run in pSQL by doing `\i db/migrations/01_peep_messages_table.sql` from the root directory of the repository

### Adding initial peeps to peep_messages table

1. Enter `\c chitter_app;` to connect to the database
2. Add initial peeps to `peep_messages` table by running the sql script `02_add_peeps.sql`
3. Run in pSQL by doing `\i db/migrations/02_add_peeps.sql` from the root directory of the repository

### Creating a test database for chitter app

1. Enter `psql` to connect to the database server
2. `CREATE DATABASE "chitter_app_test";` will create a test database
3. Run the SQL script `\i db/migrations/01_peep_messages_table.sql;` to create an empty peep_messages table in the test database
4. Ensure you include `ENV['ENVIRONMENT'] = 'test'` in your `spec_helper.rb` file and check that the peep class is pointing to the correct database
5. 

```ruby

# Set to test environment
ENV['ENVIRONMENT'] = 'test'

# Configuration of test db
RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end


```

### Adding users table on the Chitter app database

1. Enter `\c chitter_app;` to connect to the database
2. Create `users` table by running the sql script `03_users_table.sql`
3. Run in pSQL by doing `\i db/migrations/03_users_table.sql` from the root directory of the repository
4. Now you have a users table to manage users

