require 'simplecov'
require 'simplecov-console'
require 'rspec'
require 'capybara'
require 'rake'
require 'pg'

#setting up the environment to "test"
require_relative './setup_test_database'
ENV['RACK_ENV'] = 'test'
RSpec.configure do |config|
  config.after(:suite) do
    setup_test_database
  end
end


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
  ])
  SimpleCov.start

  #


  # require our Sinatra app file
  require File.join(File.dirname(__FILE__), '..', 'app.rb')
  require 'capybara'
  require 'capybara/rspec'
  require 'rspec'
  require 'sinatra'
  Capybara.app = Chitter
