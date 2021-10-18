source 'https://rubygems.org'

ruby '3.0.2'

gem "sinatra"
gem "sinatra-contrib"
gem "capybara"
gem "pg"
gem "nokogiri", ">= 1.12.5"
gem "sinatra-flash"
gem "webrick"

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
