Chitter Challenge
=================

I completed the Straight Up part plus some CSS.

Features:
-------

```
STRAIGHT UP

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

Notes on functionality:
------
Tests written with RSpec and Capybara

gems installed:

ruby '2.4.1'

gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'rack'
gem 'rake'
gem 'sinatra'
gem 'sinatra-flash'

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

```
To run the project:
go to Heroku app: https://secret-coast-89355.herokuapp.com/
Sign up and add peeps

```
