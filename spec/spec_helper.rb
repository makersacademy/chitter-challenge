require './app/models/nom'
require './app/app'

require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'data_mapper'

require 'coveralls'
require 'simplecov'

Capybara.app = NomDiaries

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!


# Capybara.app = Nom
