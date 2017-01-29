Chitter Challenge
=================
[![Build Status](https://travis-ci.org/mbgimot/chitter-challenge.svg?branch=master)](https://travis-ci.org/mbgimot/chitter-challenge)  

The aim of the game is to write a little Twitter clone that will allow the users to post messages to a public stream.

Heroku Link:
https://chitter-mbg.herokuapp.com/

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

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Additional Functional Requirements:
------
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

Installation Instructions
-----------
Clone repository:
```
git clone https://github.com/mbgimot/chitter-challenge  
bundle
```

Create local databases:
```
psql
createdb chitter_development
createdb chitter_test
```

Migrate/Upgrade databases:
```
rake db:auto_migrate
rake db:auto_upgrade
```

Tests (run from root directory):
```
rspec
```

Run in development environment on localhost:
```
rackup
```

Future Developments:
-----
* In order to start a conversation as a maker I want to reply to a peep from another maker.
* Pure design development with CSS
* Maker can delete their own peep but not other peeps
* Maker can reset password
* Maker can filter peeps for specific content

Technologies Used
-----------
* Ruby 2.3.3 OOP
* Deployed to Heroku for production environment
* Sinatra (DSL for web apps with Ruby)
* EncryptedCookie middleware for Sinatra session encryption
* BCrypt password hashing
* Datamapper as a ORM
* Postgresql powered databases

Contributors
-----
Mitchell Goldbay [github](https://github.com/mbgimot/) [mitchellgoldbay@gmail.com](mailto: mitchellgoldbay@gmail.com)
