Chitter Challenge
=================
This project aims to replicate twitter. My application can be found on Heroku  
[Chitter2017](https://chitter2017.herokuapp.com/)


User Story:
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
```

The list of gem used in this project :

gem 'sinatra'
gem 'sinatra-flash'
gem 'bcrypt'
gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'dm-timestamps'

group :test do
  gem 'rspec'
  gem 'cucumber'
  gem 'rubocop-rspec'
  gem 'rubocop'
  gem 'coveralls', require: false
  gem 'rspec-sinatra'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
end
