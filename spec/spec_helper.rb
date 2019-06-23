require File.join(File.dirname(__FILE__), '../app/', 'app.rb')
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require_relative './setup_test_database'


ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app  = ChitterApp

RSpec.configure do |config|
  config.filter_run_when_matching :focus
  config.before(:each) do
    setup_test_database
  end
end
  
RSpec.configure do |config|
  config.after(:suite) do
  end
end
