# Chitter Challenge #

A web application that allows users to post messages ("peeps") to a public strean.

## Objective

Using TDD principles follow the MVC architecture to build an application that connects to a database.

## Technologies used

Ruby w/ Sinatra and PostreSQL. Tested using RSpec and Capybara.

## How to use ##

#### Clone repo

```
git clone https://github.com/Reeshul/chitter-challenge
```

#### Change directory

```
cd chitter-challenge
```

#### Install gems

```
bundle
```

#### Setup Database

1. Connect to psql using the command `psql`
2. Create a development database using the psql command `CREATE DATABASE chitter;`
3. Connect to the database using the psql command `\c message_manager;`
4. Run `CREATE TABLE messages(id SERIAL PRIMARY KEY, message VARCHAR(300));`
5. Run `ALTER TABLE messages ADD COLUMN date_time_stamp TIMESTAMP;`
6. Run `ALTER TABLE messages ALTER COLUMN date_time_stamp SET DEFAULT now();`

#### Run local server

```
ruby app.rb
```

#### Open app

Open browser and head to `http://localhost:4567`