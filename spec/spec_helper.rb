<<<<<<< HEAD
ENV['RACK_ENV'] = "test"
require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'

require_relative '../app/data_mapper_setup'
require_relative './web_helper'
# require_relative './helpers/users'
# require_relative './helpers/peeps'
=======
require 'coveralls'
require 'simplecov'
>>>>>>> 1ec1413865ab4e5dd0990904025289af31194cc3

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
<<<<<<< HEAD

Capybara.app = Chitter

RSpec.configure do |config|

  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end


end
=======
>>>>>>> 1ec1413865ab4e5dd0990904025289af31194cc3
