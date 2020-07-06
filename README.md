# Chitter
This program gives users an opportunity to contribute their thoughts to the world through the short messages, or <Peeps>. This service, while not novel in idea, is unique as it runs as a platform without advertising and with minimal user tracking. This development gives users' the piece of mind that they can use the service uninterupted.
  
## Program Installation
1. To use the project you will need access to a code editing program and have <PostgreSQL> [installed](https://www.postgresql.org/download/) on your computer.

2. Once these requirements have been met you will need to create a database & table in your PSQL database. Please run the following commands
> CREATE DATABASE chitter_manager;
> CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(140), user_name VARCHAR(10), user_handle VARCHAR(20), create_time VARCHAR(20));

3. Clone the repo to your local and run <bundle install> in the working directory that you cloned the files to.
  
4. To run the app run <rackup -p 1234> in your terminal and visit <http://localhost:1234> in your client.

## Features
The following features have been implemented.

> As a Maker
> So that I can let people know what I am doing  
> I want to post a message (peep) to chitter

> As a maker
> So that I can see what others are saying  
> I want to see all peeps in reverse chronological order

> As a Maker
> So that I can better appreciate the context of a peep
> I want to see the time at which it was made

The remaining feature set is yet to be realised.

## Technical Approach
The program has been built using <Ruby> to run the back-end and <Sinatra> to provide the rack framework.
  
The program is designed with a single class; Peep which is responsible for creating and calling messages. The class uses Postgres to retain information through the connected database. An extension of the model would be to separate out database connections into a separate class.

## Testing Framework
The program is built with two testing frameworks; <rSpec> is used to unit test and <rSpec with Capybara> is used to feature test.
  
The program has been fully feature and user tested to the extent that it has 100% coverage across all lines of code.
