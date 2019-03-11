# Warbler Challenge
---------------------

[![Maintainability](https://api.codeclimate.com/v1/badges/a006a0a831cefacf9f40/maintainability)](https://codeclimate.com/github/CKKH/chitter-challenge/maintainability)

Building a Twitter clone webapp with TDD and Sinatra.


## Requirements
----------------

### Essentials
--------------

 1. Ruby and RVM, please see https://rvm.io/rvm/install for installation instructions
 2. PostgreSQL, please see http://www.postgresqltutorial.com/install-postgresql/ for installation instructions

### Clone & build dependancies
------------------------------

Once your system has the above requirements installed, from your command line move to your project directory and run the following commands.

From your termainal, navigate to a suitable installation location (e.g. A project directory) and input the following commands:

1. Clone the repository `git@github.com:CKKH/chitter-challenge.git`
2. Change directory `cd chitter-challenge`
4. Bundle dependencies `bundle`
5. Set up the databases:
   `rake db:create:all`
   `rake db:auto_migrate RACK_ENV=test`
   `rake db:auto_upgrade`
6. Run locally `rackup`

### Using Warbler
-----------------

Navigate to warbler via `local host:9292` in your browser.

## Technologies used
--------------------

Tech | Description
------------- | -------------
[Ruby](https://www.ruby-lang.org/en/) | Main language
[Sinatra](http://sinatrarb.com/) | DSL for quickly creating web apps in Ruby
[Active Record](https://guides.rubyonrails.org/active_record_basics.html) | A tool for facilitating
the creation and use of business objects whose data requires persistent storage
to a database
[RSpec](https://github.com/rspec/rspec) | Behaviour Driven Development for Ruby
[Capybara](https://github.com/teamcapybara/capybara#using-capybara-with-rspec) | Acceptance test framework for web applications
[Code Climate](https://codeclimate.com/) | Automated code review for code quality and complexity

## Test Coverage
-------------

17/18 tests passing, the final one passes when ran in isolation. 100% test coverage. 
To run run the tests and see the test coverage input `rspec` in the root of the
project's directory.

## User Stories
---------------

```
As a Maker
So that I can let people know what I am doing
I want to post a message (chirrup) to Warbler

As a maker
So that I can see what others are saying if I'm interested
I don't need to have an account

As a maker
So that I can see when others posted a chirrup
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a chirrup
I want to see the time at which it was made

As a Maker
So that I can post messages on Warbler as me
I want to sign up for Warbler

As an Admin
So I know an account can't be linked to the same email
Users can only create an account with an email once

As an Admin
To keep the identities of users seperate
Usernames can only be assigned to one account

As a Maker
So that only I can post messages on Warbler as me
I want to log in to Warbler

As a Maker
So that I can avoid others posting messages on Warbler as me
I want to log out of Warbler

As a Maker
So when I don't want to use Warbler anymore
I want to delete my Warbler account
```
