source 'https://rubygems.org'

ruby '3.0.2'

gem "pg", "~> 1.5"
gem "sinatra", "~> 3.0"
gem "sinatra-contrib", "~> 3.0"
gem "webrick", "~> 1.8"
gem "activerecord", "~> 7.0"
gem "rake", "~> 13.0"
gem "sinatra-activerecord", "~> 2.0"
gem "bcrypt", "~> 3.1"

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem "rack-test", "~> 2.1"
end

group :development, :test do
  gem 'rubocop', '1.20'
end


