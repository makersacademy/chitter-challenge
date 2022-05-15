require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require_relative '../app'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative './setup_test_database'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
