# README

## User Stories

STRAIGHT UP
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
- complete

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
-complete

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
-complete

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## Database Setup
1. Connect to 'psql'.
2. Create database using 'psql' command:
```
CREATE DATABASE chitter;
```
3. Connect to newly created database:
```
\c chitter;
```
4. Run scripts in 'db/migration' directory in order.

## Test Database Setup
1. Connect to 'psql'.
2. Create database using 'psql' command:
```
CREATE DATABASE chitter_test;
```
3. Connect to newly created database:
```
\c chitter_test;
```
4. Run scripts in 'db/migration' directory in order.
