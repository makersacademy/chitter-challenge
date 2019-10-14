Chitter
=======
-------

A basic small Twitter clone that will allow the users to post messages to a public stream. Current functionality allows users to sign up, view and post peeps(tweets).

Further work required to finished implementing the mapping of the user_id's to stored and displayed peeps.

SETUP
-------
```
$ git clone https://github.com/smasonmalik/chitter-challenge
$ bundle
$ rake setup
$ rake migrate
$ rspec
$ rackup
```

User stories
-------

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

FEATURES IN DEVELOPMENT

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
