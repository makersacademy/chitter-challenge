ENV['ENVIRONMENT'] = 'test'

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require_relative '../app'
require_relative './setup_test_database'
require_relative './database_helpers'
require 'capybara/rspec'
require 'features/web_helper'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
