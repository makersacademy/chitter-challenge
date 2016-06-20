Chitter Challenge
=================

A little Twitter clone that will allow the users to post messages to a public stream.

![Heroku Chitter Screenshot](https://dl.dropboxusercontent.com/u/68781931/makers/chitter_screenshot.png)

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

Notes on functionality / technologies used:
------

* Built on Sinatra / Ruby framework
* Rspec / Capybara test driven development
* Makers can sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Uses bcrypt to secure the passwords.
* Uses data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You can only peep if you are logged in.

Guide to installing / running the app locally (development mode)
-----------

- Download / clone the app

```
$ bundle install
$ psql
$ CREATE DATABASE chitter_development
$ CREATE DATABASE chitter_test
$ \q
$ rake db:auto_migrate
$ rake db:auto_migrate RACK_ENV=test
$ rspec
$ ruby app.rb
```

- Go to your browser and type the link shown in the Sinatra instance (usually localhost:4567)
- You can now run the app and the data will persist to the database. For more instructions on actually using the app, see below for Heroku:

Running the app on Heroku (production mode)
-----------

- Go to http://makerschitter.herokuapp.com 
- Preview the peep stream by clicking 'All Peeps' in the navigation bar
- To write a peep, you need to first sign up, and then sign in
- To signup, click the 'sign up' button in the header
- You will automatically be signed in after signing up, so you can write a new peep now by clicking 'New Peep'
- If you have previously signed up and signed out, you can sign in again with your credentials and then write a new peep.


