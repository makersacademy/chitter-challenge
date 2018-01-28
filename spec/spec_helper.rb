ENV["RACK_ENV"] = 'test'
require 'simplecov'
require 'simplecov-console'
require_relative '../app/app'
require_relative '../app/model/peep'
require 'capybara/rspec'
require 'database_cleaner'
require 'timecop'
require 'orderly'
require_relative './features/web_helpers'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# ENV["RACK_ENV"] = 'test'
# require './features/web_helpers'

Capybara.app = Chitter

# DatabaseCleaner.clean_with :truncation
# DatabaseCleaner.strategy = :transaction

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

  # config.after(:suite) do
  #   puts
  #   puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
  #   puts "\e[33mTry it now! Just run: rubocop\e[0m"
  # end
end
