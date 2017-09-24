# Chitter Challenge
=================

This project addresses the user stories below:

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

```

## My Approach

I took a test-driven development approach to this project. There are two models used - Peep and User, with the program using DataMapper to store information (e.g. message & timestamp for Peep, username & password for User).

Currently, functionality covers all of the above user stories, with users able to sign up for Chitter and post Peeps (with timestamps) that display in reverse chronological order.

## Setup

To set up the program, follow the steps below

```
$ git clone https://github.com/wmcabangon/chitter-challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rackup
```

## Next steps

THe next steps include a sign out feature for users, as well as the ability to reply to Peeps.
