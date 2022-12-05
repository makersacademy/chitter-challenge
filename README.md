Chitter Challenge
=================

Challenge:
-------

In this challenge, we are building a twitter clone using Ruby, ERB, HTML and PostgreSQL.

User Stories:
-------

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

Technologies used:
-----

* Ruby
* PostgreSQL

* Ruby Gems:
  * Sinatra 
  * Rspec
  * Capybara
  * Rubocop
  * SimpleCov
  * Timecop

Features:
------

* Users can post a message (peep) to the Chitter timeline
* All users can view all peeps in reverse chronological order
* All peeps have the time of posting displayed
* All users can sign up for a Chitter account 
* Users can log in and out of Chitter

This program allows user to sign up for Chitter
This program allows user to log in to Chitter
This program allows user to log out of Chitter
This program has a database connected to Heroku

How to install:
------

* Clone this repository 
* Create the database using the sql file: chitter-challenge/database/chitter_database.sql
* Install the gem files using the terminal command 'bundle install' 
* Use the command 'Rackup' to run the Sinatra Server
* Use the command 'Rspec' to see test coverage 

