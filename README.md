Chitter Challenge
=================

### Context
Makers Academy - Week three weekend challenge:

Write a small Twitter clone that will allow the users to post messages to a public stream.

### Build Status  
* Three of four base user stories test driven and working. More details on stories and features below.

### Document Organisation
* Details for this challenge can be found in challenge_brief.md
* Models: ./lib/
* Views: ./views/
* Controller : app.rb
* Tests: ./spec/

### Technologies Used
__Development Environment__

* Languages: Ruby, SQL
* Framework:  Sinatra  

__Test Environment__

* Feature testing: Rspec, Capybara
* Unit testing:  Rspec
* Analytics: simplecov

__Database__

* RDBMS: PostgreSQL
* Integration & setup: PG gem, psql

### User stories - Features

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

### Domain Models

<img src="https://github.com/Kintaro-Oe/chitter-challenge/blob/master/pictures/chitter%20domain%20modelling.jpeg" width="40%">

### How to install
__Base install__

 * Open your terminal and clone the project by entering `git clone <repo url>`
 * Navigate into the new directory using `cd chitter-challenge`
 * Once inside type `bundle install`. This will install all the gems needed to launch and test the app.

__Database setup__

You will need to set up local databases in order to run and test this app properly. This step requires terminal. Please open one and navigate to your new chitter-challenge directory if you haven't already done so.

* Install `psql` by entering `brew install postgresql`

* Then enter the following line:
`psql -f ./db/migrations/01_create_peeps_table.sql`
This will run the SQL script in `db/migrations` folder and setup the appropriate tables needed.

## How to Run__
__Launching & closing the server for the app__

* Enter `rackup -p 3456` into command line to start the server. (4567 may be changed to any port number you like)
* Enter `CTRL+C` to close the server

__Using the app__

* Enter the url `http://localhost:3456/chitter` in your browser to view the app (or your chosen port number)
* Enter a peep (message) and hit post

__Testing__

* Open your terminal, navigate to the chitter-challenge directory and run `rspec`
