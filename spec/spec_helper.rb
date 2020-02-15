require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])

SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app.rb')
# require files here

Capybara.app = Chitter
