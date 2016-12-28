Chitter
=================

Week 4 Weekend Challenge - A twitter clone where you can see a public stream of 'Peeps' posted by users and sign up to post Peeps yourself.

Visit https://louisa-chitter.herokuapp.com/ to play with the app. If you would like to run the app locally, please see instructions below on how to install.

Technologies used:
-------
* Code has been written in Ruby
* RSpec, Capybara - Test Driven Development
* Used BCrypt to secure the passwords
* Used Datamapper and Postgres to save the data
* Database Cleaner to clean before and after each test
* Sinatra (DSL) to create the Ruby web application
* Deployed to Heroku
* RESTful URLs
* Rake
* HTML/CSS

Functionality:
-------
* Can sign up to Chitter with email, password, name and a username
* The username and email have to be unique
* Users must provide matching password and password confirmations
* Peeps (posts to Chitter) have the name of the User and their User handle.
* All Peeps are public, you don't have to be logged in.
* You can only post a Peep if you are logged in.

User Stories:

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


How to install and run the tests:
------
* Fork and clone the forked repository to your machine
* Run `gem install bundle` (if you don't have bundler already)
* In your terminal, run `bundle` to install all the gem dependencies
* In your terminal, create the postgres databases - chitter_development and chitter_test. To do this, enter `psql` in your terminal, then enter `CREATE DATABASE chitter_test;` and `CREATE DATABASE chitter_development;`. Finally, enter `\q` to exit psql.
* Run `rackup` to kick start the game on a local server.
* In your preferred browser, navigate to http://localhost/9292
* If you would like to run the tests, run `rspec` in your terminal. You may also see the test coverage by running `coveralls report`.

Future changes:
-----

* Ability to start a conversation by replying to a peep from another user.
* Refactor controller into individual files and update layout to use partials.
* Implement password recovery, using Timecop
* Update layout and CSS.

## Authors
[Louisa Spicer](https://github.com/louisaspicer)
