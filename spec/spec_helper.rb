require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require_relative '../app'
require_relative 'web_helper'

ENV['RACK_ENV'] = 'test'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    delete_and_fill_database
    log_out_active
  end
end
