# Chitter web app

A Twitter clone, incorporating the following user stories:

Features:
-------

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

Chitter is built using HTML, Ruby, Sinatra, Postgresql and DataMapper. Users must sign in with a unique username, and cannot sign up if their email address has already been registered.

Testing was done using Capybara and RSpec - to stop new users being created with each test, DatabaseCleaner is used to clear out the database at the beginning of each test.

# Instructions for usage

 - Clone this repo to your local machine and run `bundle`.

 - Create a chitter_development database using Postgres on your local machine.

 - visit https://chitter-123.herokuapp.com/users/new to get started (This will change with improvements and a homepage sign up - yet to come!)
