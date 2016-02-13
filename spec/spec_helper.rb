require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require './app/chitter'
require 'capybara'
require 'rspec' 
require 'capybara/rspec'
require './spec/web_helpers'

Capybara.app = Chitter


