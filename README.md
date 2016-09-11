How to use this app
=================

###Heroku Version:
* Visit https://chitter-rosie.herokuapp.com/
* Play around with the heroku web version

###Local Version:
* Clone this repo down in order to have a local version
* Create a pair of local postgres database by running these commands:
```
*psql* --> launch postgresql from the command line
*create database "chitter_test"* --> create a database for your test environment
*create database "chitter_development"* --> create a database for your development environment
```
* Run "rake db:auto_migrate" to ensure the database tables have the correct fields
* Run "bundle" to ensure all gems are installed
* Run "rackup" and go to the local host given to play around with a local version of the app

User Stories:
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

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality:
------

* Users sign up to chitter with their email, password, name and a user name
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Passwords are secured and users are saved in a postgres database
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests

Let the chitter begin!
