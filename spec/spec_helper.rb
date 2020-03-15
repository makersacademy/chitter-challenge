# frozen_string_literal: true
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative './setup_database_test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = ChitterManager

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
