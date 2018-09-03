# Chitter Challenge

This challenge aims to build a clone of 'Twitter' using the framework Sinatra, Ruby and PostgreSQL databases.
This program was built test-first using RSpec and Capybara.

At the moment, this program doesn't include the following functionalities:
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

Preview
-------
![Chitter Preview](./public/img/Chitter.gif)

Run the app
-------

To download and run the app:
```sh
$ git clone git@github.com:ChocolatineMathou/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ rackup -p 4567
```
Then in your favourite browser, type `localhost:4567/` to access the homepage.

Database Model
-------

To run this app, you will need a database with two tables.
Table 1: peeps

| Column Name | Data Type |
| ----------- | --------- |
| id          | serial primary key |
| peep        | varchar(240) |
| time        | varchar default to_char(Now(), 'HH24:MI') |

Table 2: profile

| Column Name | Data Type |
| ----------- | --------- |
| id          | serial primary key |
| username    | varchar(30) |
| email       | varchar (100) |
| name        | varchar (300) |
| password    | varchar (50) |


Features:
-------

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
```
