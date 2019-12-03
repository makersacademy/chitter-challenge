# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::Console
  ]
)
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require_relative './database_helpers'
require_relative '../app'
Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
