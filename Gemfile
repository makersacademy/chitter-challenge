source 'https://rubygems.org'

ruby '2.2.3'

gem 'selenium-webdriver'
gem 'shotgun'

group :development do
  gem 'sinatra'                     # web framework
  gem 'data_mapper'                 # ORM for sinatra
  gem 'dm-postgres-adapter'         # database
  gem 'pg'                          # deploying to heroku
  gem 'bcrypt'                      # encrypting passwords for database
  gem 'sinatra-flash'               # displaying error messages
end

group :test do
  gem 'rspec'                       # unit testing library
  gem 'rspec-sinatra'               # addon unit testing library for sinatraß
  gem 'capybara'                    # feature testing for web applications
  gem 'cucumber'
  gem 'rake'
  gem 'coveralls', require: false   # analysing test coverage
  gem 'rubocop-rspec'               # analysing test cleanliness/style
  gem 'rubocop'                     # analysing code cleanliness/style
  gem 'database_cleaner'
end
