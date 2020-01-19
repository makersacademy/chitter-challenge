# Chitter Challenge

Light and fast Twitter clone.

Register your account and peep around!

## Getting started

* Fork this repo, and clone to your local machine with `git clone`
* Install PostgreSQL with `brew install postgresql`
* Start PSQL with `psql postgres`
* Create the chitter database with `CREATE DATABASE chitter;`
* Create the chitter_test database with `CREATE DATABASE chitter_test;`
* Connect to the chitter databse with `\c chitter`
* Create the users table with `CREATE TABLE users( id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, username VARCHAR(30) UNIQUE NOT NULL, email VARCHAR(255) UNIQUE NOT NULL, password VARCHAR(255) NOT NULL);`
* Create the peeps table with `CREATE TABLE peeps( id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id) NOT NULL, content VARCHAR(280) NOT NULL, created_on TIMESTAMP NOT NULL);`
* Connect to chitter_test database with `\c chitter_test`
* Create the users and peeps tables with the previous commands
* Exit PSQL with `\q`

## Usage

* Run the command `bundle`
* Run the command `rspec` to test the app
* Run the command `ruby app.rb`
* Open your browser and connect to `http://localhost:4567/`
* Register yourself and start to peep!