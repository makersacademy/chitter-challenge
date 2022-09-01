source 'https://rubygems.org'

ruby '3.0.2'

gem 'sinatra'
gem 'sinatra-contrib'
gem "sinatra-activerecord", "~> 2.0"
gem "rake", "~> 13.0"
gem "database_cleaner-active_record", "~> 2.0"
gem "pg", "~> 1.3"
gem "activerecord", "~> 7.0"
gem "bcrypt", "~> 3.1.7"

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false

end

group :development, :test do
  gem 'rubocop', '1.20'
end
