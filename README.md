# Chitter Challenge

## Description

This program is a basic Twitter clone, where users can post 'peeps' that are presented in reverse chronological order with the time they were posted.

## Instructions for Use

1. Clone this repo

2. Run the command `bundle install` in your terminal to install all the gems in the Gemfile

3. Connect to psql

4. Create the database using the psql command `CREATE DATABASE chitter_manager;`

5. Connect to the database using the pqsl command `\c chitter_manager;`

6. Run the query saved in the file 01_create_peeps_table.sql

7. Follow the same steps to create a chitter_manager_test database with the same table

8. Run the command rackup and visit your localhost using the port provided

## User Stories

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## Technologies Used

* Ruby

* Capybara

* Sinatra

* PostgreSQL for database management

* TablePlus as a database interface

* Rubocop for linting and formatting

* SimpleCov for analysis of test coverage

## Example Screenshot

![Chitter challenge screenshot](https://i.imgur.com/1lByToh.jpg)

## Improvements I Would Like to Implement

Given more time I would like to have added a User class and database in order to manage user registration, so that users have to sign up to Chitter before they're allowed to post. More like the real thing, basically.

Ideally I'd also have used CSS to pimp up the design. As it is, I left it plain and focused on the development given that it was my first time using databases.

[Jonny Abrams](https://github.com/jonnyabrams)

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)