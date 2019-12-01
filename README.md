Chitter Challenge
=================
[![Build Status](https://travis-ci.org/jessmar94/chitter-challenge.svg?branch=master)](https://travis-ci.org/jessmar94/chitter-challenge) 
## Summary
Write a small Twitter clone that allows users to post messages to a public stream. More info on the project can be found here: https://github.com/makersacademy/chitter-challenge. 

This project has 8 passing tests with 100% test coverage. 

## Plan 
### User Story 1
```bash
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
- Create peep_manager database and peep_manager_test database
- Create peeps table within both databases which has ID, message, name and handle columns.
- Create Peep class in peep.rb file and Peeps class in app.rb file

Domain Mapping:
- self.create method
- | peep | <-- create -->
- | peeps | <-- all -->

| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate peep data in a class    |
| View        | Display the result to a user                  | Show the peep data in a chronological list  |
| Controller  | Get data from the model and put in the view   | Render peep data into to the view   |

User Flow:
1. Visit page /peeps/new
2. Type out peep (include max. character count of 280 characters), name and Chitter handle
3. Submit the peep
4. See the new peep on the /peeps page, with the writer's name and Chitter handle attached

### User Story 2
```bash
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
- use self.all method created in US1 and call .reverse on the iteration
User Flow:
1. Visit page /peeps
2. See peeps in chronological order

### User Story 3
```bash
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
- use timestamp feature to view the timestamp next to each peep
- will need to create 'created_at' column in database table

User Flow:
1. Visit page /peeps
2. See peeps in chronological order with timestamp printed alongside peep

### User Story 4
```bash
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
- Create chitter_manager database and chitter_manager_test database
- Create chitter table within both databases, which includes the following columns: user ID, email, password, name and a username
- Add user_id to peeps table

User Flow:
1. Visit page '/'
2. Click sign up button
3. Visit page /chitter/register
4. Fill out sign up form
5. Click submit
6. Taken to page /chitter where you can see the peeps
7. When you go to create a peep, your name and handle field are auto-populated

## SQL Queries
### Create Peep_Manager Database and Peeps Table
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE peep_manager;`
3. Connect to the database using the `psql` command `\c peep_manager`
4. Run the query I have saved in the file `01_create_peeps_table.sql`

### Create Peep_Manager_Test Database and Peeps Table
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE peep_manager_test;`
3. Connect to the database using the `psql` command `\c peep_manager_test`
4. Run the query I have saved in the file `01_create_peeps_table.sql`

### Add created_at column to Peeps Tables
1. Connect to `psql`
2. Connect to the database using the `psql` command `\c peep_manager_test`
3. Run the query I have saved in the file `02_add_created_at_column.sql`
4. Repeat from step 2 but connect to `\c peep_manager`

## How to Install and Run 
To play the game first clone this repository and move to the directory the repo has been cloned to.
Follow the SQL commands above to setup the required databases locally. 
To see the repository in action first install the dependencies by running
```
bundle install
```
and then load the webpage by running
```
rackup
```
Navigate to localhost:9292 in your web browser.

## How to Run Tests 
1. Run the command `rspec` in your terminal. 
2. Run the command `rubocop` in your terminal to check code quality. 

## Project Status
As of October 14th 2019, the first three user stories have been implemented. 

In order to implement User Story 4, I plan to create a users table which connect up with the peeps table via a user_id column. I will also need to create a User Class which will handle all the information around the user, such as their email address. Once the user has signed up, every time they post, it will either auto-populate the name/handle section with their details or automatically post the peep with their details so they don't have to fill it out themselves.

