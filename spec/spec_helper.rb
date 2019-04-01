ENV['ENVIRONMENT'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'
require 'simplecov'
require 'simplecov-console'
require './spec/setup_test_database.rb'

require File.join(File.dirname(__FILE__), '..', 'app.rb') # requires sinatra app file

Capybara.app = ChitterApp

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.example_status_persistence_file_path = "examples.txt"
  config.before(:each) do
    setup_test_database
  end

end
