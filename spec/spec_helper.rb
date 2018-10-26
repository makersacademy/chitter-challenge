ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'
require_relative './setup_test_database'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'rake'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end
end
