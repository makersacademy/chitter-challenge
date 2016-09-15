Chitter Challenge
=================

Challenge:
-------

Write a Twitter clone that will allow users to post messages to a public stream.

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

Notes on functionality:
------

* Users sign up to chitter with their email, password, name and a user name.
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

Installation instructions:
------

To join the fun (on your own...) get set up locally using the following command line instructions:

```
$ git clone https://github.com/AbigailMcP/chitter-challenge.git
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```

Or, how about joining the buzzing online community? Check out the deployed version on heroku: https://chitteraway.herokuapp.com/peeps

Technologies:
------

Chitter uses DataMapper and PostgreSQL to manage and save user's data and map individual peeps to individual users.

Chitter also uses BCrypt to securely store users' passwords and verify passwords on log in.
