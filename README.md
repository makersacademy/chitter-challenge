Chitter Challenge
=================

This is my Makers weekend challenge for week 4.

### User stories
(:heavy_check_mark: bellow means the user story has been implemented, :construction: bellow means the user story is in progress)

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
:heavy_check_mark:
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
:heavy_check_mark:
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
:heavy_check_mark:
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
:construction:
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

### Set up

Clone this repo and run:
```
bundle
```
### Setup databases

Connect to psql and create `chitter` and `chitter_test` databases:
```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```
To set up the appropriate tables, connect to each database in psql and then run the each SQL script in the db/migrations folder in order.

### To run the Chitter app
```
rackup -p 3000
```

To view peeps, navigate to localhost:3000/peeps.

### To run tests
```
rspec
```

### To run linting
```
rubocop
```
