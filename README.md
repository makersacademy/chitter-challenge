# Chitter
Chitter is a clone of Twitter where a user can sign up, create a peep, and see other users peeps

### Dependancies
* This app uses sinatra
* The tests run on capybara and rspec
* PG to create an interface between ruby classes and the database

### How to set up the Database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE dear_diary;
3. Connect to the database using the pqsl command \c chitter;
4. Run the query I have saved in the file 01_create_users_table.sql
