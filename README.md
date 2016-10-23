# Chitter Challenge
=================

## Progress

- [x] Sign up implemented with datamapper and bcrypt
- [x] Sign in & Sign out
- [ ] Posting Peeps
- [ ] Display Peeps reverse chronologically
- [ ] Improve UI with CSS


## Instructions

```
$ git clone https://github.com/andygjenkins/chitter-challenge.git
$ cd chitter-challenge
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```

## User Stories

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

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.
