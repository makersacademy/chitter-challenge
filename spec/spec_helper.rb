require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'database_cleaner'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app'
require './app/models/user.rb'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

ENV["RACK_ENV"] = "test"

# require File.join(File.dirname(__FILE__), '..','app.rb')


Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL
end
