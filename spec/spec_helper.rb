ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'simplecov-console'
require './app/app'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require './app/models/user'

Capybara.app = Chitter

DatabaseCleaner.strategy = :truncation

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console])

SimpleCov.start

RSpec.configure do |config|
  config.include Capybara::DSL
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
