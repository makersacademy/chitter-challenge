Narayan's Chitter Challenge
=================
[![Build Status](https://travis-ci.org/nryn/chitter-challenge.svg?branch=master)](https://travis-ci.org/nryn/chitter-challenge)

Description:
-------

A little Twitter clone that allows users to post messages and replies to a public stream.

Lives on the internet here: [Chitter by nryn](about:blank)

Usage:
------

* Clone repo and `cd` into project root directory.
* To download dependencies, `gem install bundle` then `bundle`.
* Set up databases, make sure you've a local version of psql (if you don't, but have homebrew then do `brew install psql`)
* `createdb chitter_test` will create the database used by the test environment (automatically wiped before and after each test)
* `createdb chitter_development` will create the database for messing around locally
* `rspec` to run tests
* `rackup` to set up the local server, then you can visit `http://localhost:9292/` in your web browser to give it a spin.
* Enjoy.

Alternative Usage Instructions:

* Have a go with the live version on [Heroku](about:blank).


Dependencies:
------

* Ruby 2.4.0
* To run locally, you can get the following gems with `gem install bundle` followed by `bundle`
* Sinatra, BCrypt, Postgres, DataMapper (+psql adapter), DatabaseCleaner
* Tests: RSpec, Capybara

Notes:
------

* TDD used (RSpec). Feel like the models helper methods are under-tested, but I found they were hard to test since they rely on local variables coming from a browser which are hard to mock.
* Makers sign up to chitter with a username which must be unique
* They are then prompted to confirm the account by providing and email (must be unique), first name, and confirming their password.
* Using bcrypt to secure the passwords.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Used DataMapper and postgres for DB stuff.
* You don't have to be logged in to see the peeps.
* You only can peep or reply if you are logged in.

Screenshots:
-------
![desktop logged in](http://img1.imagilive.com/0317/Screen_Shot_2017-03-12_at_144435.png)

![mobile portrait logged in](http://img1.imagilive.com/0317/Screen_Shot_2017-03-12_at_143741.png) ![mobile portait logged out](http://img1.imagilive.com/0317/Screen_Shot_2017-03-12_at_144058.png)

![desktop closeup](http://img1.imagilive.com/0317/Screen_Shot_2017-03-12_at_144257.png) ![desktop zoomed](http://img1.imagilive.com/0317/Screen_Shot_2017-03-12_at_143839.png)

User Stories Implemented:
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

As a maker
In order to start a conversation as a maker
I want to reply to a peep from another maker
```
