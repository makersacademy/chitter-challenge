source 'https://rubygems.org'

ruby '3.0.2'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem "database_cleaner", "~> 2.0"
  gem "rack-test", "~> 2.0"
end

group :development, :test do
  gem 'rubocop', '1.20'
  gem "pg", "~> 1.4"
  gem "activerecord", "~> 7.0"
  gem "sinatra-activerecord", "~> 2.0"
  gem "rake", "~> 13.0"
  gem "sinatra", "~> 3.0"
  gem "sinatra-contrib", "~> 3.0"
  gem "webrick", "~> 1.8"
  gem "bcrypt", "~> 3.1"
end




