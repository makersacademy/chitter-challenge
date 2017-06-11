
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
* User login
* User can create new posts via an online form
* Posts belong to the users that create them

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

* Add a timeline view which retrieves all posts from the database, and then iterates through them to display the newest messages at the top of the page
