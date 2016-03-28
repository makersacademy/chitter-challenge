Chitter Challenge [![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)
=================
This app was developed through TDD according to the following user stories:

```sh
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
Technologies used:
------
* RSpec
* Sinatra
* Capybara
* BCrypt
* DataMapper
* Postgres
* Rake

Functionality
--
Posts are visible to guests or registered users, but only registered users can 'peep'. The posts (peeps) are displayed with the username and a timestamp, in reverse chronological order.

Usernames and email addresses are unique, validated by through DataMapper with `dm-validations` gem, and passwords are encrypted with the excellent `bcrypt`.

Installation:
------
`git clone` this repo, and run `bundle install` to update your environment with all the necessary gems.

`coveralls report` will run all rspec tests, and return a coverage report. Note that the database and its relations in the testing environment will be wiped every time a test is run, through use of the `database_cleaner` gem.

`rackup -p 4567` starts Sinatra on a Webrick server in a development environment, the result of which you can see, and interact with, in your browser on `localhost:4567`

Alternatively, visit the production env [here](http://chittah.herokuapp.com).

Screenshots
--
_homepage:_

![Imgur](http://imgur.com/QSnrbWD)

_sign up:_

![Imgur](http://imgur.com/Gc21bPc)
_log in:_

![Imgur](http://imgur.com/7qyom1D)

_log in error message:_

![Imgur](http://imgur.com/WQziv9U)

_peeps page as logged in user_

![Imgur](http://imgur.com/mv5QZZv)
