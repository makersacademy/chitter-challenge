Chitter 
=================

Chitter is a small Twitter clone that will allow users to post messages to a public stream.

## User Stories

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


## Domain Model

(see Chitter_domain_model.jgp)


## How to use

### To set up the project

Clone this repository and then run:

```
bundle
```

### To run tests:

```
rspec
```

### To set up the database:

```
1. Connect to 'psql'
2. Create the database using the 'psql' command
CREATE DATABASE chitter
3. Connect to the database using the 'psql' command
c\ chitter;
4. Run the query in the file db/migrations/01_create_chitter_table.sql
```

### To set up the test database:

1. Connect to 'psql'
2. Create the database using the 'psql' command
CREATE DATABASE chitter_test
3. Connect to the database using the 'psql' command
c\ chitter;
4. Run the query in the file db/migrations/01_create_chitter_table.sql

```