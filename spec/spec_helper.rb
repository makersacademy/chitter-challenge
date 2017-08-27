ENV['RACK_ENV'] = 'test'

require_relative './../models/peep'
require 'simplecov'
require 'simplecov-console'
require_relative './../app'
require 'database_cleaner'
require 'capybara'
require 'capybara/rspec'
require 'launchy'
require_relative './features/web_helpers'

Capybara.save_path = '/Users/stephengeller/Desktop/Projects/makers-academy/week-4/weekend-challenge/chitter-challenge/logs'
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,])
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
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
