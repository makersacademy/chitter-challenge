# Chitter Challenge

A web application that allows users to post messages ("peeps") to a public stream.

## Objective

Using TDD principles follow the MVC architecture to build an application that connects to a database.

## Technologies used

Ruby w/ Sinatra and PostreSQL. Tested using RSpec (unit) and Capybara (feature).

## User stories

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

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

#### Download repo and install packages

1. Clone repo `git clone https://github.com/Reeshul/chitter-challenge`
2. Change directory `cd chitter-challenge`
3. Install gems `bundle`

#### Development Database Setup

4. Connect to psql `psql`
5. Create a development database `CREATE DATABASE message_manager;`
6. Connect to the database `\c message_manager;`
7. Run the commands in the `db/migrations` directory
8. Exit psql `\q`

Optional - to run the tests a test database will also need to be set up. Create another database called `message_manager_test` following steps 4-8 above again.

#### Using the app

9. Run local server `ruby app.rb`
10. Open browser and head to `http://localhost:4567`
