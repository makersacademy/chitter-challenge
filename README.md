# Chitter Challenge
Solving makers chitter challenge. This is a twitter-style application where users can see messages posted from other users, with some functionality to sign up and log in to post their own messages.

(More information in original readme - https://github.com/makersacademy/chitter-challenge)

This application is written in Ruby with html, using Rspec and Capybara for testing. The underlying postgresql databases are accessed using the 'pg' gem.

In the application users can sign up or log into an existing account, with passwords stored in encryption using `bcrypt`.

## Running the application

First you'll need to set up the postgresql databases - one for production and one for testing.

To do this run `psql` from the terminal and run the three lines of SQL found in `./db/create_database.sql`.

You'll be able to run the application by using the command `rackup` in the terminal and visiting the local port returned by the terminal, in the browser.

## Tests
Feature tests use Capybara, and unit tests use Rspec (with >98% coverage). To run the tests use the command `rspec` in the terminal.

## Things still to do
I didn't have time to finish _everything_ I wanted to do on this project - here's what I wanted to do if I'd had time:

* Finish the authentication user story to account for when a user gives the wrong password or username
* Finish the log out user story
* Allow users to give their email and name on sign up (as well as username)
* Ensure username and email are unique on signup
* Move database connections into DatabaseConnection class
* Add some css styling
* Add some diagrams to show the system set up
* Incorporate Active Record as an ORM
* Bonus user stories
