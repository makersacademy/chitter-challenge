source 'https://rubygems.org'
ruby '2.4.0'

group :production, :development do
  gem 'sinatra'
  gem 'bcrypt'
  gem 'pg'
  gem 'data_mapper', '1.2.0'
  gem 'dm-postgres-adapter'
  gem 'rack'
  gem 'rerun'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec'
  gem 'cucumber'
  gem 'capybara'
  gem 'rake'
  gem 'coveralls', require: false
end
