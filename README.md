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

4. Connect to psql `psql`
5. Create a development database `CREATE DATABASE message_manager;`
6. Connect to the database `\c message_manager;`
7. Run the commands in the `db/migrations` directory
8. Exit psql `\q`

To run the tests a test database will also need to be set up.

#### Test Database Setup

9. Connect to psql `psql`
10. Create a development database `CREATE DATABASE message_manager_test;`
11. Connect to the database `\c message_manager_test;`
12. Run the commands in the `db/migrations` directory
13. Exit psql `\q`

#### Using the app

14. Run local server `ruby app.rb`
15. Open browser and head to `http://localhost:4567`