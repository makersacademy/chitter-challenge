ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    # setup_test_database_user
    setup_test_database_message
    setup_test_database_security
  end
end

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
# require 'setup_test_database_user.rb'
require 'setup_test_database.rb'
# require 'setup_test_database_security.rb'
# require 'web_helpers.rb'
require 'orderly'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start
