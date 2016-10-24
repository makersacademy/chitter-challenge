Chitter Challenge
=================

The application is a clone of the Twitter application.  Users sign up to chitter with their username and a password. Users don't have to be logged in to see the peeps, however you only can peep if you are logged in.

To run the application:

Fork this repo (https://github.com/james1968/chitter-challenge.git)
Git clone to your local machine.
Review Gemfile and ensure all gems are installed.
Run bundle to ensure all dependencies are included.
Note the application use a database to store the peeps, there you will need to have postgres psql installed.
Bcrypt is used to secure the passwords.
Data mapper and postgres to save the data.

Features:
-------
The following have been addressed by the application.  Please note not all features are currently available within the application as it is still work in progress.
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter
```
```
Outstanding Features

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
Notes on functionality:
------
