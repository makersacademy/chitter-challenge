ENV["RACK_ENV"] = "test"

require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require 'capybara/rspec'
require './app/app'
# require 'features/web_helpers'
# require '/app/models/hub'

Capybara.app = Chitter
# require 'features/web_helpers'
# require File.join(File.dirname(__FILE__), '..', '.app/app.rb')
