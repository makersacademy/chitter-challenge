# Chitter Challenge

## The challenge

Write a small Twitter clone that will allow the users to post messages to a public stream.

## Features

- [ ] Post a peep (message)
- [ ] Peeps are shown in reverse chronological order
- [ ] Peeps have a timestamp
- [ ] Chitter sign-up

### User stories:
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

## Getting started

#### **Tech**

- `ruby`
- `sinatra`
- `capybara`
- `rspec`
- `postgresql`
- `pg`

#### **Installation and setup**

#### Download

1. Fork [this repo][chitter repo] and `git clone` it to your local system.
1. Use `Homebrew` (or your prefered package manager) to install and manage packages.
1. `brew install bundler`
1. Run `bundle install` to install the required 'gems' from the Gemfile.
1. `brew install postgres`
    - Follow post installation instructions.
    - `brew service start postgresql`
    - Create `chitter` and `chitter_test` databases using `psql`
        - `CREATE DATABASE chitter;`
        - `CREATE DATABASE chitter_web;`
    - Create tables in each database using the `psql` sequences in `db/migrations`

[chitter repo]: https://github.com/J-son1/chitter-challenge

#### **Usage**

#### PostgreSQL

##### Startup

```psql
$ psql postgres
postgres=#
```
##### Commands

- `postgres=# \l` - List all database tables
- `postgres=# \q` - Quit `psql`

#### Rack

##### Startup

- Run `rackup` to start a local server:

```
$ rackup
```

#### Browser
- Use `localhost:XXXX/peeps` with 4-digit port number to view chitter homepage.

## Technical Approach

## Notes

## Testing

#### **RSpec**

- Run `rspec` from the projects root directory.

#### **SimpleCov**

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
```
