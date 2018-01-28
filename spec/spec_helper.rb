ENV["RACK_ENV"] = "test"
 require 'sinatra'
 require 'capybara'
 require 'rspec'
 require 'capybara/rspec'
 require 'simplecov'
 require 'simplecov-console'
 require './app/models/peep'
 require './app/app'
 require 'database_cleaner'
 require 'orderly'

 Capybara.app = Chitter

 RSpec.configure do |config|
   # Everything in this block runs once before all the tests run
   config.before(:suite) do
     DatabaseCleaner.strategy = :transaction
     DatabaseCleaner.clean_with(:truncation)
   end

   # Everything in this block runs once before each individual test
   config.before(:each) do
     DatabaseCleaner.start
   end

   # Everything in this block runs once after each individual test
   config.after(:each) do
     DatabaseCleaner.clean
   end
 end

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
