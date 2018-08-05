ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'cucumber'
# require 'database_cleaner'
require 'rake'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'sinatra'
require 'sinatra/flash'

Capybara.app = Chitter
Rake.application.load_rakefile

# DataMapper.setup(:default, 'postgres://user:password@hostname/database')

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  # config.before(:each) do
  #   require_relative './test_database_setup'
  # end
  config.include Capybara::DSL

  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end
  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end
   
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
   
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
