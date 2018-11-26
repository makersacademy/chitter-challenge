# Chitter

##Chitter

This project allows a user to post messages to a public stream.  The user will be able to add a message and view all messages in reverse chronological order.  
This is the Week 4 challenge, which followed on from a week focusing on the basics of how databases function and how information is retrieved from them HTML requests using Sinatra, Ruby, HTML and CSS, PSQL and SQL

To complete this challenge I used the MVC model in order to keep code clean and readable.

##User Stories

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

## Getting started

`https://github.com/SBriscoe2/chitter-challenge.git`

## Usage

`command_to_start`
`run from command line using 'rackup'`
`open browser and enter 'http:/localhost:(servernumber)'``

# Create the bookmark_Manager database

```
Connect to psql
Create the database using the psql command CREATE DATABASE chitter_manager;
Connect to the database using the pqsl command \c chitter_manager;
Run the query saved in the file 01_create_peep_table.sql
Run the query saved in the file 02_add_timestamp_to_peep.sql
```

#Create test database

```
Connect to psql
Create the database using the psql command CREATE DATABASE chitter_manager_test;
Connect to the database using the pqsl command \c chitter_manager_test;
Run the query saved in the file 01_create_peep_table.sql
Run the query saved in the file 02_add_timestamp_to_peep.sql
```

## Running tests

`test_command` (`rspec`)`

<!-- `Travis CI tests passed status badge added: -->
