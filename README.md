
Chitter Challenge
=================

Makers Academy week four weekend project to build 'chitter' - a web app to enable users to post short messages on a public feed. 

<img width="616" alt="screen shot 2017-06-28 at 21 59 32" src="https://user-images.githubusercontent.com/20523607/27659958-345b7b76-5c4d-11e7-80ba-79cb84efb4df.png">

Installation & Testing
--------

* Simply fork or clone this repo, and run `bundle install`
* Run `rackup` and navigate to localhost:9292
* App is configured to run with a Postgres database
* Tests can be run by running `rspec` on the command line in the main project directory

Features
--------

* User registration with BCrypt password encryption
* User login and log out
* User can create new posts via an online form
* Posts appear in reverse chronological order on a feed, each with its author's name, and the date and time of publication

Technologies & Principles
-------------------------

* Ruby
* Sinatra
* DataMapper
* BCrypt
* PostgreSQL
* RSpec
* Capybara

Further Development
-------------------

* Add a facility to edit and delete posts.
* Allow users to change their password, and to delete accounts.
