# Chitter Challenge #

  This project is a small twitter clone that combines databases (SQL) with Ruby, Rspec, Sinatra, and Capybara to create a functioning app.

## What criteria does this program satisfy?
- Ability to post a message (peep).
- View all peeps in reverse chronological order.
- View the time a peep is made.
- Ability to sign up for Chitter.

## How to get this app
1. Fork and clone this repository.
2. Ensure all gems are installed using `bundle install`.
3. Create the database(s) required by following the steps under the 'How to create the databases' heading.

## How to create the databases
1. `psql` : open your user database in the command line.
2. `CREATE DATABASE chitter;` : create a database.
3. `CREATE DATABASE chitter_test;` : create a database for testing.
4. \c chitter; : connect to the chitter database.
5. Access 01_create_chitter_table.sql located within db/migrations/. Run the query within both databases.

## How to run the app
  Use `rackup -p 2345` in your command line in order to start the server.
  Use the url `http://localhost:2345/` to view the server.
