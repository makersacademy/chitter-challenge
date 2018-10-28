ENV['ENVIRONMENT'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'
require 'simplecov'
require 'simplecov-console'
require_relative './database_clean.rb'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
  config.include Capybara::DSL
  config.default_formatter = 'doc'
end
