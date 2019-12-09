require 'simplecov'
require 'simplecov-console'

ENV['RACK_ENV'] = 'test'
ENV["ENVIRONMENT"] = "test"
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app.rb'
require 'pg'
require_relative 'features/db_helper'
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    refresh_db
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
