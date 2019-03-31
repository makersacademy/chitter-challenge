ENV['ENVIRONMENT'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require './scripts/setup_test_database.rb'

require File.join(File.dirname(__FILE__), '../app', 'chitter.rb') # requires sinatra app file

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.example_status_persistence_file_path = "examples.txt"
  config.before(:each) do
    setup_test_database
  end

end

