Chitter
=======
It's a Twitter clone that I made using Ruby, Sinatra, and PostgreSQL. I have written my tests using rspec and Capybara

Installation Instructions
=========================

Fork and clone this repo

Run ```bundle```

## Database setup instructions
I used PostgreSQL to create a database called chitter, which contained two tables called 'users' and 'peeps'.

1) `brew install PostgreSQL`

2) `ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents`

3) `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`

4) Run: `psql PostgreSQL`

5) Then, create the database in psql using:
`CREATE DATABASE bookmark_manager;`

6) Connect to the database using:
`\c bookmark_manager`

7) Run the query in the file, *01_create_users_table.sql*

8) Run the query in the file, *02_create_peeps_table.sql*


User Stories
============

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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.
