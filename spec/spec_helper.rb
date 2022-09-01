require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner/active_record'
require 'active_support'

DatabaseCleaner.strategy = :truncation

ENV['RACK_ENV'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

require 'features/web_helpers'
require File.join(File.dirname(__FILE__), '..', '/app/app.rb')
Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.clean
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
