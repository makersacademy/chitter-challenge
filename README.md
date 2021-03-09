# Chitter Challenge
  =================

## Brief

The purpose of this project was to write a small Twitter clone that would allow the users to post messages to a public stream.

A user doesn't have to be logged in to see the peeps. Users sign up to chitter with their email, password, name and a username, where the username and email are unique. Peeps (posts to chitter) have the name of the maker and their user handle.

## User Stories
```
1.  As a Maker
    So that I can let people know what I am doing  
    I want to post a message (peep) to chitter

2.  As a maker
    So that I can see what others are saying  
    I want to see all peeps in reverse chronological order

3.  As a Maker
    So that I can better appreciate the context of a peep
    I want to see the time at which it was made

4.  As a Maker
    So that I can post messages on Chitter as me
    I want to sign up for Chitter

5.  As a Maker
    So that only I can post messages on Chitter as me
    I want to log in to Chitter

6.  As a Maker
    So that I can avoid others posting messages on Chitter as me
    I want to log out of Chitter
```

## Technologies Used:

Ruby, RSpec, PostgresSQL, Sinatra, Capybara

## Getting Started

Clone the repository from GitHub:
```
$ git clone https://github.com/PiperS52/chitter-challenge.git
$ cd chitter
```
Load the dependencies:
```
$ bundle install
```
Create a new database with tables in psql:
```
$ psql postgres;

CREATE DATABASE chitter;
CREATE TABLE users(id SERIAL PRIMARY KEY, fullname VARCHAR(60), username VARCHAR(60), email VARCHAR(60), password VARCHAR(60));
CREATE TABLE peeps(id SERIAL PRIMARY KEY, fullname VARCHAR(60), username VARCHAR(60), content VARCHAR(240), created_at timestamp(0) NOT NULL DEFAULT now());
```
Complete above steps for `CREATE DATABASE chitter_test;`

Run the server:
```
$ rackup
```
visit http://localhost:9292/peeps
