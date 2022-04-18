source 'https://rubygems.org'

ruby '3.0.2'

gem 'sinatra'
gem 'sinatra-contrib'
# gem 'thin' # What is this? Do I need it? From the learn.co sinatra active record setup guide
#gem 'require_all' # What is this? Do I need it? From the learn.co sinatra active record setup guide
#gem 'activerecord' # Gives us access to the magical database mapping and association powers
#gem 'rake' # Short for 'ruby make'. lets us quickly create files and folders, and automate tasks such as database creation
#gem 'sinatra-activerecord' # Gives us access to some awesome Rake tasks


group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

group :development do
  #gem 'shotgun' # What is this? Do I need it? From the learn.co sinatra active record setup guide
  #gem 'pry' # What is this? Do I need it? From the learn.co sinatra active record setup guide
  #gem 'sqlite3' # Database adaptor, allows Ruby application to communicate with a SQL database
  #gem 'tux' # gives us an interactive console that pre-loads our database and ActiveRecord relationships for us
end
