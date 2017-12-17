ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'simplecov-console'

require './app/app.rb'
require './app/models/peep.rb'
require './app/models/user.rb'
require_relative './web_helper'

require 'sinatra/flash'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:suite) do
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
  DatabaseCleaner.start
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end


  config.after(:each) do
    DatabaseCleaner.clean
  end

end
