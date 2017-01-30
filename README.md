# Chitter Challenge

Solo weekend challenge #4 for [Makers Academy] (http://www.makersacademy.com).

Twitter clone.

User stories 
----

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
Gems used
-------

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

Installation
-------
* Clone the repository and switch to Ruby version 2.2.3
```shell
$ git clone https://github.com/samjones1001/chitter-challenge
$ cd chitter-challenge
$ rvm 2.2.3
```

* Install gems
```shell
$ gem install bundle
$ bundle
```
* Create Postgres databases
```shell
$ psql
$ createdb chitter_development
$ createdb chitter_test
```

Local usage
----------------------

```shell
$ rackup -p 4567
```
Browse to `http://localhost:4567`

Heroku
----------------------
(https://chitter-chal.herokuapp.com)



