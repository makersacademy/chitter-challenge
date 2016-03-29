require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
SimpleCov.start

ENV["RACK_ENV"] = "test"

require 'capybara'

require 'capybara/rspec'
require './app/app'
require 'tilt/erb'
require 'database_cleaner'


require 'features/web_helper'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')


Capybara.app = Chittr

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.backtrace_exclusion_patterns = [
    /\/lib\d*\/ruby\//,
    /bin\//,
    /gems/,
    /spec\/spec_helper\.rb/,
    /lib\/rspec\/(core|expectations|matchers|mocks)/
  ]
  # For full stack trace do rspec --backtrace
end
