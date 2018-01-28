ENV['RACK_ENV'] = 'test'
# require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require './app/app'
require 'database_cleaner'
require 'orderly'
require 'helpers'


Capybara.app = Chitter


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])

SimpleCov.start

RSpec.configure do |c|
  c.include Helpers
end

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end



RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
