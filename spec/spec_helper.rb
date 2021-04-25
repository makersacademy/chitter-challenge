require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require_relative 'setup_test_database'

console = [SimpleCov::Formatter::Console, SimpleCov::Formatter::HTMLFormatter]
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(console)
SimpleCov.start

p 'Setting up test environment...'
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Chitter

RSpec.configure do |config|
  config.before do
    setup_test_database
  end
end
