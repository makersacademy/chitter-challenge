# frozen_string_literal: true

require_relative './setup_test_database'

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require './app'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                                 # SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

Capybara.app = DuckBoard

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
