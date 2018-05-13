require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require 'capybara'
require 'capybara/rspec'
require 'rspec'

require_relative '../app'

ENV['RACK_ENV'] = 'test'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    load 'setup_test_database.rb'
  end
end
