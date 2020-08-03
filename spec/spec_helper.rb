require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'database_helpers.rb'
require_relative '../app'
require_relative './setup_test_database.rb'
require_relative '../database_connection_setup.rb'

ENV['ENV'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])
SimpleCov.start
Capybara.app = ChitterApp
