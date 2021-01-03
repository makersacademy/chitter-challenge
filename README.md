# Chitter Challenge
A small Twitter clone that will allow users to post messages (peeps) to a public stream

## Motivation
This project is an unguided, solo, understanding check of TDD, OOD, MVC, of a web application with a database.

## Build status
[![Build Status](https://travis-ci.com/chriswhitehouse/chitter-challenge.svg?branch=master)](https://travis-ci.com/chriswhitehouse/chitter-challenge)

## Code style
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

## Screenshots
Include logo/demo screenshot etc.

## Tech/framework used
Ruby with Sinatra web framework, and PostgreSQL database. Tested using Rspec, and Capybara DSLs with Rubocop and Simplecov.

## Features
### User Story 1
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

![Class Diagram](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_1/class.svg)
![Entity](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_1/entity.svg)
![Sequence](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_1/sequence.svg)

### User Story 2
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

![Class Diagram](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_2/class.svg)
![Entity](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_2/entity.svg)
![Sequence](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_2/sequence.svg)

### User Story 3
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

![Class Diagram](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_3/class.svg)
![Entity](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_3/entity.svg)
![Sequence](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_3/sequence.svg)

### User Story 4
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

![Class Diagram](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_4/class.svg)
![Entity](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_4/entity.svg)
![Sequence](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_4/sequence.svg)

### User Story 5
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

![Class Diagram](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_5/class.svg)
![Entity](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_5/entity.svg)
![Sequence](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_5/sequence.svg)

### User Story 6
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

![Class Diagram](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_5/class.svg)
![Entity](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_5/entity.svg)
![Sequence](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_5/sequence.svg)

## Code Example
### Controller
```Ruby
require "sinatra/flash"
require "sinatra/base"
require "./database_connection_setup"

class Chitter < Sinatra::Base
  enable :sessions

  register Sinatra::Flash

  get "/" do
    redirect "/peeps"
  end

  get "/peeps" do
    @user = User.find(session[:user_id]) if session[:user_id]
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post "/peeps" do
    Peep.create(message: params[:message], user_id: session[:user_id])
    redirect "/peeps"
  end

  get "/peeps/new" do
    @user = User.find(session[:user_id])

    if @user
      erb :'peeps/new'
    else
      flash[:notice] = 'Please sign or log in to Peep'
      redirect '/peeps'
    end
  end

  get "/users/new" do
    erb :'users/new'
  end

  post "/users" do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])
    session[:user_id] = user.id
    redirect "/peeps"
  end

  get "/sessions/new" do
    erb :'sessions/new'
  end

  post "/sessions" do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = "Incorrect email or password"
      redirect '/sessions/new'
    end
  end

  post "/sessions/destroy" do
    session.clear
    flash[:notice] = "You have logged out"
    redirect '/peeps'
  end

  # establish server if file run directly
  run! if app_file == $0
end
```

## Installation

1. Fork and clone the project.
2. Run `$ bundle install`.
3. Create the chitter and chitter_test databases (as per below)

### Database Setup

1. Connect to psql
2. Create a development database using the psql command `CREATE DATABASE chitter;`
3. Connect to the database using the psql command `\c chitter;`
4. Run the query we have saved in the file '01_create_peeps_table.sql'
5. Run the query we have saved in the file '02_add_timestamp_column.sql'
6. Run the query we have saved in the file '03_create_users_table.sql'
7. Run the query we have saved in the file '04_add_user_id_column_to_peeps.sql'
8. Create a test database using the psql command `CREATE DATABASE chitter_test;`
9. Repeat steps 3 and 6 for the test database.

## Tests
20 examples, 0 failures, 100% Coverage

1. So that I can let people know what I am doing,
  I want to post a message (peep) to chitter :white_check_mark:

2. So that I can see what others are saying,
  I want to see all peeps in reverse chronological order :white_check_mark:

3. So that I can better appreciate the context of a peep
  I want to see the time at which it was made :white_check_mark:

4. So that I can post messages on Chitter as me,
  I want to sign up for Chitter :white_check_mark:

5. So that only I can post messages on Chitter as me,
  I want to log in to Chitter,
    Happy path: user has correct credentials :white_check_mark:
    Unhappy path 1: user has incorrect email :white_check_mark:
    Unhappy path 2: user has incorrect password :white_check_mark:

6. So that I can avoid others posting messages on Chitter as me
  I want to log out of Chitter :white_check_mark:

DatabaseConnection
  .setup
    should respond with 1 argument :white_check_mark:
    should establish a connection with a given database :white_check_mark:
  .query
    should respond with 1 argument :white_check_mark:
    should execute the query string :white_check_mark:

Peep
  .create
    should insert into peeps table and return an instance of a Peep :white_check_mark:
    should return nil if no user_id is nil :white_check_mark:
  .all
    should return all peeps in the peeps table :white_check_mark:

User
  .create
    should insert a user into users table and return an instance of a User :white_check_mark:
    hashes the password using BCrypt :white_check_mark:
  .find
    should return a specific user, by id, from the users table in an instance :white_check_mark:
 of a User
    should return nil if user_id is nil :white_check_mark:

  .authenticate
    should return a user if the user details match an existing user :white_check_mark:

## How to use?

1. Run `$ rackup`.
2. Navigate to 'localhost:9292/' in browser.
3. Sign in
4. Peep!
