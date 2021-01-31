# Chitter Challenge #

A web application that allows users to post messages ("peeps") to a public strean.

## Objective

Using TDD principles follow the MVC architecture to build an application that connects to a database.

## Technologies used

Ruby w/ Sinatra and PostreSQL. Tested using RSpec and Capybara.

## How to use ##

#### Download repo and install packages

1. Clone repo `https://github.com/Reeshul/chitter-challenge`
2. Change directory `cd chitter-challenge`
3. Install gems `bundle`

#### Development Database Setup

1. Connect to psql `psql`
2. Create a development database `CREATE DATABASE message_manager;`
3. Connect to the database `\c message_manager;`
4. Run the commands in the `db/migrations` directory
5. Exit psql `\q`

To run the tests a test database will also need to be set up. Similar steps but a "_test" is appended to the name of the database.

#### Test Database Setup

1. Connect to psql `psql`
2. Create a development database `CREATE DATABASE message_manager_test;`
3. Connect to the database `\c message_manager_test;`
4. Run the commands in the `db/migrations` directory
5. Exit psql `\q`

#### Run local server

```
ruby app.rb
```

#### Open app

Open browser and head to `http://localhost:4567`