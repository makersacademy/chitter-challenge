source 'https://rubygems.org'
ruby '2.2.3'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rspec-sinatra'
  gem 'rubocop-rspec'
  gem 'rubocop'
  gem 'coveralls', require: false
  gem 'database_cleaner'
end

group :test, :development do
  gem 'pry'
  gem 'rake'
end

group :development do
  gem 'data_mapper'
  gem 'dm-postgres-adapter'
  gem 'sinatra'
  gem 'dm-validations'
  gem 'sinatra-flash'
  gem 'sinatra-partial'
end
