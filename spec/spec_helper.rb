ENV["RACK_ENV"] = 'test'

require 'capybara/rspec'
require './lib/server.rb'

Capybara.app = Sinatra::Application

# SimpleCov.formatters = [
#   SimpleCov::Formatter::HTMLFormatter,
#   Coveralls::SimpleCov::Formatter
# ]
# Coveralls.wear!
