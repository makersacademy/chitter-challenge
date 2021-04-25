require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

console = [SimpleCov::Formatter::Console, SimpleCov::Formatter::HTMLFormatter]
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(console)
SimpleCov.start

p 'Setting up test environment...'
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Chitter
