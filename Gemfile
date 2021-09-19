source 'https://rubygems.org'

#ruby '3.0.2'
ruby '2.7.3'

gem 'sinatra'
gem 'sinatra-contrib'
gem "pg"    # for Postgres
gem "rake"  # so we can run Rake tasks
gem "sinatra-activerecord"    # for Active Record models
gem 'rexml'

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
