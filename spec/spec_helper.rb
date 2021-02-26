require 'coveralls'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])

SimpleCov.start
Coveralls.wear!

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV']    = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rake'
require 'rspec'

require_relative '../app/chitter'

Capybara.app = Chitter

Rake.application.load_rakefile
