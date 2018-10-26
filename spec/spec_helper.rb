require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
# require 'features/web_helpers.rb'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = Chitter

# require_relative 'setup_test_database.rb'

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
#    setup_test_database
  end
end
