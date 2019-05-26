Chitter Challenge
=================

Description
-----------

This is the result of the fourth weekend challenge for submission to Makers Academy. It is a web application that allows users to view and send messages (peeps).

User Stories
-------------

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

Getting Started
---------------

1. Clone this repo to your local machine using `git@github.com:EdinaBMakers/chitter-challenge.git`
2. Run `gem install bundle` (if it is not installed already)
3. Run `bundle`
4. Create a `PostgreSQL` database called chitter for production purposes
5. Create a `PostgreSQL` database called chitter_test for testing purposes
6. Execute the migration scripts from the `db/migrations` folder against both databases

Usage
-----

Run `ruby app.rb` or `rackup` in the terminal

Dependencies
------------

This program uses the following gems:

```
source 'https://rubygems.org'

ruby '2.5.0'

gem 'pg'
gem 'rake'
gem 'rubocop', '0.56.0'
gem 'sinatra'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
```

Testing
-------

#### Running Tests

Tests can be run from the root directory using the `rspec` command.

#### Test Results and Coverage

All tests pass and `simplecov` reported a test coverage of `100%`.

## Code Style

I used [Rubocop](https://rubocop.readthedocs.io/en/latest/) to ensure that Ruby coding standards are followed.
