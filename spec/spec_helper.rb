ENV['ENVIRONMENT'] = 'test'
require_relative './setup_test_database'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'sinatra/base'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
require File.join(File.dirname(__FILE__), '..', 'app.rb')


Capybara.app = ChitterApp

RSpec.configure do |config|
    config.before :each do 
      setup_test_database
    end
  config.after(:suite) do
    # ActiveRecord::Base.connection.exec("DEALLOCATE ALL")
  end
end