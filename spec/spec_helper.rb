require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
# require_relative './setup_test_database'

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# require our Sinatra app file
require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

# require our test helpers
require 'features/web_helpers'

# tell Capybara about our app class
Capybara.app = App

# configure test databases
RSpec.configure do |config|
  config.before(:each) do
    ActiveRecord::Base.connection.execute("TRUNCATE users, peeps")
  end
end
