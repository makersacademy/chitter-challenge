require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require './app/app'
require 'tilt/erb'


require 'features/web_helper'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')



SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chittr

RSpec.configure do |config|
  config.backtrace_exclusion_patterns = [
    /\/lib\d*\/ruby\//,
    /bin\//,
    /gems/,
    /spec\/spec_helper\.rb/,
    /lib\/rspec\/(core|expectations|matchers|mocks)/
  ]
  # For full stack trace do rspec --backtrace
end
