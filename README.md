
Chitter Challenge
=================

Makers Academy week four weekend project to build 'chitter' - a web app to enable users to post short messages on a public feed. 

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
