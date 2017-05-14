
ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require './app/app'
require 'features/web_helpers'
require 'database_cleaner'
require 'timecop'

require_relative 'helpers/session'

RSpec.configure do |config|
  config.include SessionHelpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
Capybara.app = MessageInABottle
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
