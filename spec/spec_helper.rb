ENV['RACK_ENV'] = 'test'

require_relative '../app/app.rb'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'
require 'sinatra'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  # config.after(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  #
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
  #
  # config.append_after(:each) do
  #   DatabaseCleaner.clean
  # end
end
