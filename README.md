# Chitter app

Chitter is a social networking app that allows users to post messages about their feelings or what they are doing.

We are using this challenge as a way to learn about SQL Databases.

## Website

The LocalHost should be used to run this program.

##User Stories

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

##Program setup
Follow the below steps to interact with the app.

```
$ git clone https://github.com/katieljones/chitter_challenge
$ bundle
$ rake setup
$ rake migrate
$ rspec
$ rackup
```

## Installation

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter_manager;
3. Connect to the database using the psql command \c chitter_manager;
4. Run the query we have saved in the file 01_create_peeps_table.sql and then run 02_adding_current_time_column.sql
5. Create the same table as a test one so there are two in total
