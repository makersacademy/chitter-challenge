# Chitter
Write a small Twitter clone that will allow the users to post messages to a public stream.
Full instruction and user stories [here!](https://github.com/makersacademy/chitter-challenge)

## How to get start
```
$ git clone https://github.com/jeff1108/Chitter.rb.git
$ cd Chitter.rb
$ bundle install
```
### Start the Sinatra server
```
$ rackup -p 0000 (can replace any number) / rackup config.ru
```
if the server has successfully started, you would see:
```
[2018-08-11 18:05:40] INFO WEBrick 1.4.2
[2018-08-11 18:05:40] INFO ruby 2.5.0 (2017-12-25) [x86_64-darwin16]
[2018-08-11 18:05:40] INFO WEBrick::HTTPServer#start: pid=62522 port=0000
```
Open Chrome and type ``http://localhost:0000``

## Learning Outcome 
### Topic Covered 
* PostgreSQL (one-to-many relationship)
* RESTful routes
* MVC model
* Rspec, Capybara as test framework
* Object-Oriented Programming
* Classes, methods, instance variable
* Ensuring code is DRY
* Using Single Responsibility Principle

## State of Completion
### Implement Functionality
* It can log in (with authentication) and sign up
* It can post message with time stamp and username
* Flash message when log in with invalid username or password
* Two table (users and peeps) in database
* Classes to wrap data extracted from each database
* Module for database connection in test and development environment 
* some CSS styling 
* 97% test coverage

### WHat I would do next
* User rakefile to automate database task (setup, rest or teardown)
* Use foreign key to link with wo tables
* Use session replace instance variable in Controller
* CSS styling 
* Log out button
* Receive an email if user is tagged in a peep by using many-to-many relationship

## Introduction to setup database
1. Type in the following command to switch to postgreSQL: ``psql postgres``
2. Type in the following command to create a TEST database: ``postgres=#``
3. Create database chitter_test
4. Connect to the database: ``/c chitter_test``
5. Type in the following command to create tables in the database: ``CREATE TABLE "table_name"``
6. ``CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(15), email VARCHAR（60)， username VARCHAR(15). password TEXT)``
7. ``CREATE TABLE peeps(id SERIAL PRIMARY KET, username VARCHAR(15), messages VARCHAR(240), time VARCHAR(60), name VARCHAR(15))``
8. Type in the following command to create a DEVELOPMENT databse
9. CREATE DATABASE chitter
10. Repeat step 5-8

## Technical
### Tech
* Ruby, Sinatra
* HTML, CSS
* Rspec, Capybara, Rubocop
* Rackup, PostgreSQL
