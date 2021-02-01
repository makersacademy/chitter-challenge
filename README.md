Chitter Challenge
=================

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

### Tech Stack
* Ruby
* Sinatra
* PostgreSQL
* RSpec
* Capybara

### Installation
1. Fork and clone this repo
2. Run ```bundle```
3. Create ```chitter``` and ```chitter_test``` databases

### Run Chitter
1. Run ```rackup```
2. Navigate to ```localhost:9292``` in browser
3. Chitter!

### Database Installation
1. Run ```psql```
2. Create database ```CREATE DATABASE chitter;``` or ```CREATE DATABASE chitter_test;```
3. Connect to the databae ```\c chitter;``` or ```\c chitter_test;```
4. Run ```db/migrations/01_create_peeps_table.sql```
5. Run ```db/migrations/02_create_user_table.sql```
6. You are now connected to the database

### Methodology
1. Build sinatra framework with testing capacity
2. Create peep databases and build out connections
3. Build out controller paths
4. Create ```Peep``` class with ```.all``` and ```.create``` methods
5. Create user databases
6. Build out Sign up, sign in and sign out functionality

### Next Steps
* Connect peeps to user and display
* CSS styling
* Edit and delete peeps
* Create a userpage with just users peeps 
