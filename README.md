Chitter
=================

## About this project
Chitter is a Twitter clone web-app that I built using Ruby and Sinatra. It allows users to sign up, log in, post peeps (like tweets), and comment on peeps. Users can also view their own profile, the profiles of other users, and individual peeps.

## Learnings from this project
Through creating this app, I improved my ability to:
- Build a fullstack web application using Ruby and the Sinatra framework
- Create SQL databases and implement routes that interact with and manipulate data in these databases
- Implement user authentication using bcrypt
- Carry out unit and integrations tests with RSpec
- Use Embedded Ruby (ERB) to dynamically edit HTML view pages
- Style websites with CSS

## Installation
### How to install the code
- Clone this repository to your local machine:
``git clone git@github.com:atcq9876/chitter-challenge.git``
- Navigate to the project directory:
``cd chitter-challenge``
- Install the necessary dependencies:
``bundle install``

### How to set up the databases
- Install PostgreSQL database (if necessary)
- Run the following commands in the terminal to create the necessary databases:
``createdb chitter_development``
``createdb chitter_test``
- Run the following commands to set up the tables in the development database:
``psql -h 127.0.0.1 chitter_development < chitter_tables.sql``
- Run the following commands to set up the tables and seeds in the test database:
``psql -h 127.0.0.1 chitter_test < chitter_tables.sql``
``psql -h 127.0.0.1 chitter_test < /spec/seeds_chitter.sql``

### How to run the code
- Navigate to the project directory:
``cd chitter``
- Run rackup:
``rackup``
- Open your web browser and go to http://localhost:9292/
- You can then navigate the website. Please note that if you're not logged in, you won't be able to post peeps or comment on peeps.

## How to run tests
- Navigate to the project directory:
``cd chitter``
- Run the tests:
``rspec``

## Screenshots
To be added:
- App in use
- Tests passing
- Test coverage


## Challenge spec
This project is my completed end-of-week challenge for week 4 of the Makers bootcamp. Below is the original spec / acceptance criteria for the challenge. My Chitter site meets all of the 'straight up', 'harder' and 'bonus' criteria listed below.

### Features
```
STRAIGHT UP

As a user
So that I can let people know what I am doing  
I want to post a message (peep) to Chitter

As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

### Notes on functionality
* You don't have to be logged in to see the peeps.
* Makers sign up to Chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to Chitter) have the name of the maker and their user handle.

### Bonus
If you have time you can implement the following:
* In order to start a conversation I want to reply to a peep from another user.
And/Or:
* Work on the CSS to make it look good.
