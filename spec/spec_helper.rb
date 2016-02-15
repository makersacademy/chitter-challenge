require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require './spec/web_helper'
require 'database_cleaner'
require './app/app'

Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:each) do
    DatabaseCleaner.clean_with :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean_with :truncation
  end
end