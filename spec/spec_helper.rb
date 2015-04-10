ENV["RACK_ENV"] = 'test'

require 'capybara/rspec'
require './server'


Capybara.app = Chitter

# SimpleCov.formatters = [
#   SimpleCov::Formatter::HTMLFormatter,
#   Coveralls::SimpleCov::Formatter
# ]
# Coveralls.wear!
