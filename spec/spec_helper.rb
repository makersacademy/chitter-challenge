# frozen_string_literal: true
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'database_cleaner/active_record'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = ChitterManager
DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.clean
  end
end
