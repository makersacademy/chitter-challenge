ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', './app/app.rb')

require 'capybara/rspec'
require './app/app'
require './app/models/post'
require 'simplecov'
require 'simplecov-console'
require 'database_cleaner'
require 'pry'
require 'web_helper'

Capybara.app = Blabber

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([

    SimpleCov::Formatter::Console,

    SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

RSpec.configure do |config|
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

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? Improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
