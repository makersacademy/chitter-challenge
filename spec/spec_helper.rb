require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require 'database_cleaner'
require_relative './features/web_helper'
RSpec.configure do |config|
  ENV['RACK_ENV'] = "test"

config.before(:each) do
  DatabaseCleaner.start
end

config.append_after(:each) do
  DatabaseCleaner.clean
end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

require_relative '../app/app'
require 'capybara/rspec'
require 'pry'

Capybara.app = Chitter
