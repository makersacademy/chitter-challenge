ENV['RACK_ENV'] ||= 'test'

require 'capybara/rspec'
require './app/app'
require 'database_cleaner'
require 'mail'

# require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
Capybara.app = Chitter

require 'simplecov'
require 'simplecov-console'
require 'web_helpers'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:transaction)
  end

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

Mail.defaults do
  delivery_method :test # in practice you'd do this in spec_helper.rb
end
