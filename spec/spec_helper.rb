ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'database_cleaner'
require 'dm-rspec'
require 'pry'
require 'simplecov'
require 'simplecov-console'
require 'timecop'
require 'orderly'

require './app/app'

Capybara.app = Chitter

def sign_up(name: 'Ed', 
            username: 'mr_ed', 
            email: 'email123@example.com', 
            password: 'password123', 
            password_confirmation: 'password123')
  visit '/users/new'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up!'
end

def sign_in(email: 'email123@example.com', 
            password: 'password123')
  visit '/sessions/new'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign in'
end

def create_test_user
  User.create(name: 'Ed', 
  username: 'mr_ed',
  email: 'email123@example.com', 
  password: 'password123', 
  password_confirmation: 'password123')
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
