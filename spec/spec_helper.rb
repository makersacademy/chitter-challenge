ENV['RACK_ENV'] = "test"

ENV['ENVIRONMENT'] = 'test'
require_relative './setup_test_db'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_db
  end
end

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'orderly'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
  end
end
