source 'https://rubygems.org'

bundle lock --add-platform x86_64-linux

ruby '3.0.4'

gem 'sinatra'
gem 'sinatra-flash'

# gem 'webrick'
# gem 'rerun'
gem 'pg'
gem 'bcrypt'
gem 'puma'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
