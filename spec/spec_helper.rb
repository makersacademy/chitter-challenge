# require 'coveralls'
# require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

require './app/models/peep'

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')


Capybara.app = Chitter
#
# SimpleCov.formatters = [
#   SimpleCov::Formatter::HTMLFormatter,
#   Coveralls::SimpleCov::Formatter
# ]
# Coveralls.wear!
