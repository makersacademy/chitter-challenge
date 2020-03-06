require_relative '../app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require_relative './setup_test_database.rb'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = PeepManager

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
