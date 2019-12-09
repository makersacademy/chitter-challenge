# Chitter

## Description

This is a web app that allows the user to sign up by entering their preferred username, email and password, and once this is done they are able to post a peep (similar to a tweet). The user is able to see all peeps on the homepage, in reverse choronological order.

## Installation

- Install PostgreSQL, setup your user and create a database called chitter.
- Open the db with command ```psql chitter```
- Create the two tables using the commands in db/migrations/01_create_peeps_table.sql and db/migrations/02_create_users_table.sql
- Run bundle install
- Run rspec to see tests
- Run ``` ruby app.rb ``` to use Chitter

## Technology used

- Ruby
- Sinatra
- PostgreSQL
- Capybara
- Bootstrap
- HTML
- CSS
- RSpec

## Project Status

Project is fully functioning but can be expanded to include a login system for users, deleting, updating and editable commenting on peeps.
