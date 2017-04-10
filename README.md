Chitter Challenge
=================

Write a little Twitter clone that will allow the users to post messages to a public stream.

### User stories for the project:

```
As a User
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a User
So that I can post messages on Chitter as me
I want to log in to Chitter

As a User
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a User
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a User
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a User
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## To install:

* Fork this repo & clone to your machine.
* Make sure to have Ruby 2.4 installed for this application.
* Run bundler to install gems. (You may also need to bundle update)
* Run RSpec to view or test drive new features.
* Run Rackup and type in browser your localhost address to start using the application.
* Follow the app structure below as a guide to the application structure.

## Application structure:

![app-structure](https://raw.githubusercontent.com/j-rods/chitter-challenge/master/readme-assets/structure.png)

## Technologies used:

* Ruby 2.4
* Sinatra
* RSpec
* Heroku
* Capybara
* Rack
* DataMapper
* SQL
* BCrypt
* Sinatra-Flash
* Database-Cleaner
* HTML5
* CSS3

Notes on functionality:
------

* Users can sign up to chitter with their email, password, name and a user name (e.g. test@gmail.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the user and their user handle.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
