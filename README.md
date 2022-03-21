Chitter-app
=================

## Features:
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

```

### Working on:
-----

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## Setting up the database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter_app;
3. Connect to the production database using the pqsl command \c chitter_app;
4. Run the queries saved in the db/migration folder to create the necessary tables


## How to run the tests
1. Clone this repository
2. ```cd``` into the cloned directory
3. Run ```bundle``` to install the dependencies
4. Run ```rspec```