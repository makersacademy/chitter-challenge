Chitter Challenge
=================


Prerequisites
-------
- You have installed Ruby

How to install
-------

1. Fork this repo, and clone to your local machine.
2. Run the command `gem install bundler` (if you don't have bundler already).
3. When the installation completes, run `bundle`.

To set up the database
-------
```
Create the `chitter` and `chitter_test` databases:

CREATE DATABASE chitter;
CREATE DATABASE chitter_test;

Then set up the appropriate tables in each database by running the SQL scripts in the `db/migrations` folder in the given order.
```

To set up the Chitter app
-------
```
Start the server in the terminal using rackup
```

User Stories
---------
```
STRAIGHT UP

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