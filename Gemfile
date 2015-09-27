source "https://rubygems.org"

ruby '2.2.3'

gem 'sinatra'
gem 'sinatra-flash'
gem 'sinatra-partial'
gem 'bcrypt'
gem 'timecop'
gem 'capybara'
gem 'data_mapper'
gem 'dm-validations'

group :test do
  gem 'factory_girl'
  gem 'rspec'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'coveralls', require: false
  gem 'dm-postgres-adapter'
  gem 'database_cleaner'
end

group :production do
  gem "unicorn"
end
