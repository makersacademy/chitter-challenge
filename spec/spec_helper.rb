# datbase helper
require_relative './setup_test_database'
require_relative './database_helpers'

# controller file
require File.dirname(__FILE__) + '/../app.rb'

# model file
require File.dirname(__FILE__) + '/../lib/peep.rb'

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

ENV['RACK_ENV'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
  #
  config.after(:suite) do

  end
end
