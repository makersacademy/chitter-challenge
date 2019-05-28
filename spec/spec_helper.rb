ENV['ENVIRONMENT'] = 'test'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# require_relative '../app'

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'rspec'
require_relative './setup_test_database'

# require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
