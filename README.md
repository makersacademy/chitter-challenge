# Chitter Challenge

## Task
Create a Twitter clone that will allow the users to post messages to a public stream

#### User Stories
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

#### Notes on functionality
- Makers sign up to chitter with their email, password, name and a user name
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Use bcrypt to secure the passwords.
- Use data mapper and postgres to save the data.
- You don't have to be logged in to see the peeps.
- You only can peep if you are logged in.

## Getting Started
1. Clone or download this repo and `cd` into it
1. Run `bundle install` to install the necessary gems
1. Install `postgres` with `brew`, by running `brew install postgresql`
1. Create two new databases on `postgres`: `chitter_development` and `chitter_test`
1. Run `rake db:seed` to fill the database with Jaden Smith 'peeps'

#### Testing the tests
1. Run `rspec` to check tests are passing
1. Pop open the champagne when everything is green

#### Serving the server
1. Run `rackup -p 4567` to start the server
1. Go to [http://localhost:4567](http://localhost:4567)
