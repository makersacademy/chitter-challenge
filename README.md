# Chitter Challenge

Twitter clone written in Ruby.

## It uses:

Rspec for testing.
Rack-test for testing API.
Rubocop for style checking and code formatting.
SimpleCov for coverage analysis.
WEBrick for HTTP web server.

## Features:

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

## Notes on functionality:

- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.

## If you want to try this on your computer, follow these instructions:

1. Fork this repository
2. Clone your fork to your local machine
3. Install GEMs

```ruby
bundle install
```

## Start

1. Start the server

```ruby
rackup
```

2. Browse to http://localhost:9292

You won't see any peeps until you create a user an start peeping

## Tests

- Run all tests

```ruby
rspec
```

- Run Rubocop

```ruby
rubocop
```
