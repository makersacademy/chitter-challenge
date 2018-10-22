# Chitter Challenge

[![Build Status](https://travis-ci.org/camjw/chitter-challenge.svg?branch=master)](https://travis-ci.org/camjw/chitter-challenge)
[![codecov](https://codecov.io/gh/camjw/chitter-challenge/branch/master/graph/badge.svg)](https://codecov.io/gh/camjw/chitter-challenge)

This repo is a Ruby clone of Twitter using Postgresql for database management.

## Installation

```sh
$ git clone https://github.com/camjw/chitter-challenge.git

$ bundle install

$ rspec
```
There are 37 tests which cover the codebase, and they are all passing. The unit tests give 100% coverage of the lib files.

## User Stories:

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

## Example

### The Peep Feed

The following function collects the peep feed: it sends a SQL query to the DatabaseConnection and the returns a load of peeps, which are parsed into new Peep objects. These are then displayed to the app.

```ruby
def top_peeps(number)
  query_results = @connection.query('SELECT peeps.id, peeps.contents, '\
    'peeps.timestamp, users.username FROM peeps INNER JOIN users ON '\
    "peeps.user_id = users.id ORDER BY peeps.timestamp DESC LIMIT #{number}")
  query_results.map do |hash|
    @peep_type.new(hash[:id], hash[:username], hash[:contents],
                   hash[:timestamp])
  end
end
```

## License

This repo is licensed under the MIT license.
