Chitter Challenge
=================

* A simple imitation of twitter that allows a user to sign in and tweet from their account. Allowssomeone not signed in to view the tweets but not write them. Other functionality includes signing up and logging out
* This project was made using the Sinatra framework with ~Ruby. The database sytem was created with PostgreSQL and TablePlus.

# Requirements
ruby '3.0.0'

# How to install
- open terminal and execute `git clone https://github.com/eddiearnoldz/chitter-challenge.git`
- bundle install the gem file by running `bundle install`
- in terminal run `rackup`and visit  'http://localhost:9292/peeps'

# Installing the database

- Connect to psql
- Create the database using the psql command `CREATE DATABASE chitter_manager;`
- Connect to the database using the pqsl command `\c chitter_manager;`
- Run the query we have saved in the file 01_create_chitter_table_peeps.sql
- Run the query we have saved in the file 02_create_chitter_table_users.sql

# Installing the test database

- Connect to psql
- Create the database using the psql command `CREATE DATABASE chitter_manager_test;`
- Connect to the database using the pqsl command `\c chitter_manager_test;`
- Run the query we have saved in the file 01_create_chitter_table_peeps.sql
- Run the query we have saved in the file 02_create_chitter_table_users.sql
