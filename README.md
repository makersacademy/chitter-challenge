# Chitter

This is the weekend challenge from week 4 of the Maker's academy. It is a Twitter clone, where users can post messages ('peeps') to a common newsfeed, and also register and login should they wish to post under a specific name (otherwise the peeps are anonymous). 

### Approach

I followed an incremental approach, fully implementing a user story using TDD before moving onto the next one. 

The app is written in Ruby, using Sinatra for the server and postgressql for the database, and Capybara / Rspec for testing. 

### Current features

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

### How to set up 

CREATE TABLE peeps (
 id serial PRIMARY KEY,
 content VARCHAR (300) NOT NULL
)

Run `bundle install` to install dependencies (gems).

Run `rackup config.ru` to run app. 

### How to run tests

Run `rspec` to run all tests. 