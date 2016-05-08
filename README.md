
Chitter Challenge

Features:

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
This repo works with Coveralls to calculate test coverage statistics on each pull request.


Technologies used:

RSpec
Sinatra
Capybara
BCrypt
DataMapper
Postgres
Rake

Installation:

git clone this repo, and run bundle install to update your environment with all the necessary gems.

coveralls report will run all rspec tests, and return a coverage report. Note that the database and its relations in the testing environment will be wiped every time a test is run, through use of the database_cleaner gem.

rackup -p 4567 starts Sinatra on a Webrick server in a development environment, the result of which you can see, and interact with, in your browser on localhost:4567

Check out the current version of this project on heroku: https://chittermitter.herokuapp.com
