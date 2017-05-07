#Chitter Challenge

A (very) basic Twitter clone.

## Usage:

### Option 1: Use the app on Heroku
Just visit the app [here](http://chitter-17.herokuapp.com/chitter-newsfeed)

### Option 2: Deploy locally
Ruby Code:
1. `git clone git@github.com:adc17/chitter-challenge.git`
2. `cd path/to/dir` then `bundle install`

PostgreSQL:
1. Install PostgreSQL (instructions [here](https://www.postgresql.org/download/))
2. Initialize database: `cd path/to/chitter-challenge/dir` then `rake db:migrate`

Run on a local server:
1. `cd path/to/dir` then `rackup -p 4567`
2. Visit `localhost:4567` in your browser

## Technology:







## User stories implemented:
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
