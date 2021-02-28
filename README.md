# Chitter Challenge

## User stories
```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

## Installing

### Dev stack used

**Development**
- Sinatra
- Ruby
- PG

**Test**
- Capybara
- RSpec

### Setting up the Databases
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE `chitter_test`;
3. Connect to the database using the pqsl command \c `chitter_test`;
4. Run the query we have saved in the file 01_setting_up_users_database.sql
5. Run the query we have saved in the file 02_setting_up_peeps_database.sql
6. Create the database using the psql command CREATE DATABASE `chitter_development`;
7. Repeat steps 3, 4 and 5

### How to run locally
```
$ git clone https://github.com/sandyMax974/chitter-challenge.git
$ bundle install
$ cd chitter-challenge
$ rackup
```
* Visit http://localhost:9292/


## Planning

| Peep         | User   |         Time |    Chitter |
| :-----:      | :----: |         :---: |       :---:|
| @content     | @name     | log_current() | post/create() |
| @creation_date | @username (unique) |  | list() |
| @created_by | @email (unique)|
|              | @password |

## If I had more time

**Missing functionality**
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
---------------
* Make all registration fill mandatory and use regex to expect specific inputs
* Disable post button when tweet field is empty
* Make username and email unique - this would probably be handled by the User class
* Add a log-in feature: check if username exist in DB - if yes, redirect to the feed page - if no, raise error message
* Find a way to handle special characters when posting a tweet
* Spend more time on CSS and correctly positioning elements on the page
* Look for how to handle password information and authentication
