Chitter Challenge
=================

## Context
Makers Academy - Week three weekend challenge:

Write a small Twitter clone that will allow the users to post messages to a public stream.

## Build Status  
* Three of four base user stories test driven and working. More details on stories and features below.

## Document Organisation
* Details for this challenge can be found in challenge_brief.md
* Models: ./lib/
* Views: ./views/
* Controller : app.rb
* Tests: ./spec/

## Technologies Used
### Development Environment
* Languages: Ruby, SQL
* Framework:  Sinatra  

### Test Environment
* Feature testing: Rspec, Capybara
* Unit testing:  Rspec
* Analytics: simplecov

### Database
* RDBMS: PostgreSQL
* Integration & setup: PG gem, psql

## User stories - Features

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## Domain Models

<img src="https://github.com/Kintaro-Oe/chitter-challenge/blob/master/pictures/chitter%20domain%20modelling.jpeg" width="40%">

## How to install
### Base install
 * Open your terminal and clone the project by entering `git clone <repo url>`
 * Navigate into the new directory using `cd chitter-challenge`
 * Once inside type `bundle install`. This will install all the gems needed to launch and test the app.

### Database setup
You will need to set up a local database in order for this app to function properly.

* -
* -
* -
* -


## How to Run
### Launching & closing the server for the app
* Enter `rackup -p 3456` into command line to start the server. (4567 may be changed to any port number you like)
* Enter `CTRL+C` to close the server

### Using the app
* Enter the url `http://localhost:3456/chitter` in your browser to view the app (or your chosen port number)
* Enter a peep (message) and hit post

### Testing
* Open your terminal, navigate to the newly added chitter directory and run `rspec`
