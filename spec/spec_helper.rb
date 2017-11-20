ENV['RACK_ENV'] = 'test'
# rubocop:disable all
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'database_cleaner'
require 'orderly'
require 'timecop'
require_relative 'helpers/session_helpers.rb'

require File.join(File.dirname(__FILE__), '../app/', 'app.rb')
Capybara.app = ChitterClone

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::Console,
   SimpleCov::Formatter::HTMLFormatter]
 )
SimpleCov.start

RSpec.configure do |config|
  config.include SessionHelpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.after(:each) do # <-- after each individual test roll back to "save"
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
