# Chitter Challenge
### Makers Academy Weekend Challenge No.4

[![Build Status](https://travis-ci.org/KatHicks/chitter-challenge.svg?branch=master)](https://travis-ci.org/KatHicks/chitter-challenge) [![Coverage Status](https://coveralls.io/repos/github/KatHicks/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/KatHicks/chitter-challenge?branch=master)

### Instructions

As usual, we were given from the end of the day on Friday until 9am on Monday to complete the challenge.

### Task

The task this weekend is to write a little Twitter clone that will allow the users to post messages to a public stream. It was requested that it satisfy the following user stories:

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

You can see the full task and instructions given to us in [CONTRIBUTING.md](chitter-challenge/CONTRIBUTING.md).

### Using my application

### Dependencies

* Written using **Ruby 2.4.0** and the **Sinatra** web framework
* Testing using **RSpec** and **Capybara**
* Built on a **PostgreSQL** database using **DataMapper** as the ORM

### Steps in my development process

* **Setting up my README.md structure**
  * Started off by setting up the structure of this document so that can note down my steps and dependencies throughout the development process
  * Also a useful way of familiarising myself with the required specifications before starting
* **Setting up initial app structure**
  * Created `app.rb`, `index.erb` and `config.ru` and checked that app runs locally
  * Had an issue with initialising it all automatically in the command line so set it up manually
* **Dealt with user sign up**
  * Wrote feature test first using Capybara

### Ideas for extension
