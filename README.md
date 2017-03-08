## Chitter Challenge
#### Technologies: Ruby, Sinatra, Rspec, PostgreSQL, DataMapper, HTML, CSS 
### Week 4 solo weekend challenge for [Makers Academy] (http://www.makersacademy.com)
[Outline](#outline) | [Screenshots](#screenshots) | [User Stories](#user-stories) | [Gems](#gems) | [Usage Instructions](#usage-instructions) | [Heroku](https://chitter-chal.herokuapp.com)

## Brief
We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

   * Drive the creation of your app using tests - either cucumber or rspec as you prefer
   * Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden           Joseph, tansaku).
   * The username and email are unique.
   * Peeps (posts to chitter) have the name of the maker and their user handle.
   * Use bcrypt to secure the passwords.
   * Use data mapper and postgres to save the data.
   * You don't have to be logged in to see the peeps.
   * You only can peep if you are logged in.

## Outline

## Screenshots  
#### Landing Screen



## User Stories
```
As a Maker,
So that I can post messages on Chitter as me,
I want to sign up for Chitter.

As a Maker,
So that I can post messages on Chitter as me,
I want to log in to Chitter.

As a Maker,
So that I can avoid others posting messages on Chitter as me,
I want to log out of Chitter.

As a Maker,
So that I can let people know what I am doing,
I want to post a message (peep) to chitter.

As a maker,
So that I can see what others are saying, 
I want to see all peeps in reverse chronological order.

As a maker,
So that I can better appreciate the context of a peep,
I want to see the time at which it was made.
```

## Gems
```ruby
group :test do
  gem 'rspec'
  gem 'cucumber'
  gem 'rake'
  gem 'coveralls', require: false
  gem 'capybara'
  gem 'rspec-sinatra'
end

gem 'datamapper'
gem 'dm-postgres-adapter'
gem 'dm-migrations'
gem 'dm-transactions'
gem 'dm-validations'
gem 'database_cleaner'
gem 'pg'
gem 'bcrypt'
gem 'sinatra-flash'
```

## Usage Instructions
* clone the repo and run bundle
```shell
$ git clone https://github.com/samjones1001/chitter-challenge
$ cd chitter-challenge
$ rvm 2.3.3
$ bundle
```
* Create Postgres databases
```shell
$ psql
$ createdb chitter_development
$ createdb chitter_test
```
* run tests
```shell
$ rspec
```
* start up sinatra
```shell
$ ruby app.rb
```
* in your browser, navigate to http://localhost:4567/ 
