ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '../app', 'app.rb')
require 'capybara/rspec'
require 'orderly'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'setup_test_database.rb'
require 'features/web_helpers.rb'
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    truncate_and_populate_user_table
    truncate_and_populate_peep_table
  end
end
