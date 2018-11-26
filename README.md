# Chitter#

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
## How to use and set up with DB

### DataBase
```
1- Connect to psql
2- Create the database using the psql command CREATE DATABASE chitter and chitter_test ;
3- Connect to the databases using the pqsl command \c chitter and chitter_test;
4- Run the query we have saved in the file db/migration/ in each DataBase
```
### Set up

```
- Just run 'bundle install' to install all de dependency.
```

### Run the app
```
- Run from your terminal ruby app.rb or rackup app.rb
```
### Run the test

```
- Run rspec from your terminal
```