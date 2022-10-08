source 'https://rubygems.org'

ruby '3.0.2'

group :test do 
  gem 'rspec'
  gem 'simplecov', require: false # Code coverage analysis
  gem 'simplecov-console', require: false
  gem 'rubocop', '1.20'
  gem "rack-test", "~> 2.0" # To test responses
  gem "capybara", "~> 3.37" # To test user interaction with the app
end

group :development do # So they won't get installed on the server when deploying app
  gem "tux", "~> 0.3.0" # Interactive console that pre-loads database and ActiveRecord relationships
  gem "shotgun", "~> 0.9.2" # Starts the server and displays the saved changes without restarting the server
  gem "dotenv", "~> 2.8" # For storing database variables
  gem "pry", "~> 0.14.1" # For REPL
end


gem "bcrypt", "~> 3.1" # Password encryption for security

gem "require_all", "~> 3.0" # Can require all files in the dir instead of require each file separately

gem "sinatra", "~> 3.0" # To create web app
gem "sinatra-contrib", "~> 3.0", require: false # Collection of common Sinatra extensions

gem "activerecord", "~> 7.0" # Object Relation Mapper 
gem "sinatra-activerecord", "~> 2.0" # ActiveRecord extension for Sinatra

gem "webrick", "~> 1.7" # Ruby server

gem "rake", "~> 13.0" # Automates database creation
gem "pg", "~> 1.4" # PostgreSQL











