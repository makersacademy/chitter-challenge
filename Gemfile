source 'https://rubygems.org'

ruby '3.0.0'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'capybara'
gem 'pg'
gem 'timecop'
gem 'puma'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
  gem 'rom-sql'
  gem 'rom-http'
end
#NOTE: ADDED ROM-SQL and ROM-HTTP https://rom-rb.org/learn/introduction/installation/
# in Gemfile

