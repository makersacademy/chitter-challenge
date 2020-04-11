# Chitter Challenge

A small Twitter clone project to practice TDD, OOP, Database Integrated Web Apps.

## User Stories

Must have:

> As a Maker  
> So that I can let people know what I am doing  
> I want to post a message (peep) to Chitter

> As a maker  
> So that I can see what others are saying  
> I want to see all peeps in reverse chronological order

> As a Maker  
> So that I can better appreciate the context of a peep  
> I want to see the time at which it was made

> As a Maker  
> So that I can post messages on Chitter as me  
> I want to sign up for Chitter

Should have:

> As a Maker  
> So that only I can post messages on Chitter as me  
> I want to log in to Chitter

> As a Maker  
> So that I can avoid others posting messages on Chitter as me  
> I want to log out of Chitter

Nice to have:

> As a Maker  
> So that I can stay constantly tapped in to the shouty box of Chitter  
> I want to receive an email if I am tagged in a Peep

> As a Maker  
> In order to start a conversation  
> I want to reply to a peep from another Maker

> As a Maker  
> So that my eyes do not hurt  
> I want the site to be nicely styled

## Additional requirements

- Use the `PG` gem and `SQL` queries to interact with the database.
- You don't have to be logged in to see the peeps.
- Makers sign up to Chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to Chitter) have the name of the maker and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.
- High test coverage and all tests passing
- Configure Travis,[Travis Basics](https://docs.travis-ci.com/user/tutorial/), [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

## Technical Approach

If you'd like more technical challenge this weekend, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
DataMapper

- [DataMapper ORM](https://datamapper.org/)
- [Sinatra, PostgreSQL & DataMapper recipe](http://recipes.sinatrarb.com/p/databases/postgresql-datamapper)

ActiveRecord

- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

## Instructions

_Coming soon_

### Dependencies

- Ruby
- Postgresql



### Database Setup

1. With `psql` set up the production and test databases with the following commands:

    ```psql
    CREATE DATABASE chitter;
    CREATE DATABASE chitter_test;
    ```

2. Run the commands in the files in `db/migrations` in order for each of the production and test databases.

## Screen Previews

_Coming soon_

## Development Journal

### Development Approach

I approached this project using Test Driven Development strategies:

- Only write the most basic test you need to fail.
- Only write production code to pass a failing test.
- Only write the most basic production code to pass the test.

I approached this project with object oriented programming in mind:

- Objects should encapsulate methods that are related to one another in purpose.
- Methods should have a single responsibility, so they do not do too much, and are concise.

In order to keep code clear and readable, I used rubocop for linting.

### Domain Modelling

I wrote a short CRC card model and an outline of Table Scheme:

![CRC Cards and Table Schema](./images/Chitter_CRC_Table_Schema.png)

### Prepare Testing Infrastructure

- Added Sinatra and Capybara to the gemfile.
- Added config.ru to allow rackup.
- Added testing gems and app file to `spec_helper.rb`, also configures Capybara app.
- Wrote Hello World test to check Sinatra and Capyara all working correctly. Red.
- Created `app.rb` with route for '/' returning Hello World. Green.

### User Stories 1, 2, 3

> As a Maker  
> So that I can let people know what I am doing  
> I want to post a message (peep) to Chitter

> As a maker  
> So that I can see what others are saying  
> I want to see all peeps in reverse chronological order

> As a Maker  
> So that I can better appreciate the context of a peep  
> I want to see the time at which it was made

Core functionality:

- See peeps, newest first
- Each peep has a timestamp
- Post a peep, entering the content

### Seeing some preloaded peeps

On the home page there should be a list of peeps.

Wrote a feature test to visit '/' and see a list of peeps. Red.

- Updated '/' with a hardcoded array of peeps, and to render index.erb.
- index.erb in views dir uses executive ruby to iterate over peeps array and print each one as a list item.

Green. Now should refactor the peeps from controller to model.

Wrote a test for a Peep class. The #all class method should return the previously hardcoded peep array. Red.

- Created lib dir, and peep.rb
- Wrote Peep class with class method all returning the hardcoded peep array.

Green. Now refactor for controller to use model.

- Required peep.rb in app.rb 
- Removed hardcoded peep array from '/' route and replaced with Peep.all call.

Tests still green.

The second part of this is to be able to see them in reverse chronological order. Newest first. In order for that, each peep needs to have a timestamp attached.

### Switching to Databases

This is a good point to move the peeps to a database, before things get too messy in the model.

- Created a new PostgreSQL database: chitter using the psql command:
  
  ```psql
  CREATE DATABASE chitter;
  ```

- Also created a testing database with:
  
  ```psql
  CREATE DATABASE chitter_test;
  ```

- According to the table schema I had drawn up, the peeps table needs the following columns:
  - id - serial primary key.
  - content - variable characters up to 240 in length.
  - time - a timestamp.
  - user_id - representing which user authored the peep. (this will be added later when users are implemented)

- The query to set up a table to this schema is:

  ```sql
  CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(240), time TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
  ```

- This query was saved in `01_create_peeps_table.sql` in the db/migrations dir for later reference.

Now to add some data into the databases.

- Manually inserted three peeps using the following command(The id and time are generated automatically):

  ```sql
  INSERT INTO peeps (content) VALUES ('This is so cool');
  INSERT INTO peeps (content) VALUES ('I am sending a peep');
  INSERT INTO peeps (content) VALUES ('Isolation #COVID-19');
  ```

The model needs to be updated to access the database. This is achieved using the PG gem.

- Refactored Peep.all to use a PG connection, executing a query to select all columns from the peeps table.
- The result of the query is an object containing a series of hashes that are the rows of the table. The can be mapped through putting out the 'content' value as each item of an array.

Tests still green.

### Using Test Database

Now is probably a good time make sure than tests use `chitter_test`.

- At the top of spec_helper, set ENV['ENVIRONMENT'] to 'test'
- In Peep.all, connect to either the production or test database based on the ENVIRONMENT value.

### Resetting Database for Every Test

Each test should have an empty database to run on, and they should insert the data that is needed for the test.

- Wrote a setup_test_database method in file of the same name, which connects to `chitter_test` and truncates the peeps table.
- Required this in spec_helper.rb and configured the method to run before each test.
- Updated tests to insert the data required for using PG.connect

### Ordering the peeps correctly

Added a new scenario to the view peeps feature tests. The last peep added should be the first peep displayed.

- Edited the query to return the peeps


<!-- 

In order to provide a persistent connection to the correct database, rather than setting it up every time access is required, I decided to create a DatabaseConnection class.

Wrote a test for DatabaseConnection.setup to create a connection to 'chitter_test'. Red.

- Wrote DatabaseConnection.setup to connect to the passed database using PG.connect.

Green.

Wrote a test for the connection to persist as DatabaseConnection.connection. Red.

- In .setup assigned the connection to class instance variable @connection.
- Wrote a class attribute reader (self.connection) to return @connection.

Green.

Wrote a test for DatabaseConnection.query to send an exec call to the connection created with .setup with the passed query string as arg. Red.

- Added .query to call exec on @connection with the passed query string.

Green.

Now, when tests are run there needs to be an environmental variable to distinguish test from production.

- In spec_helper.rb, set ENV['ENVIRONMENT'] with 'test'.

The app should set up a database once at the start.

- Created database_connection_setup.rb
- Simple script to decide which database to connect to based on ENV, and use DatabaseConnection.setup to connect to it.
- Required this script in app.rb

Now Peep.all can use DatabaseConnection





As the peep has an id, content, and time it probably should not be presented as an array of strings, but as an array of Peep instances that respond to id, content and time.

Wrote a test 

-->