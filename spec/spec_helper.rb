ENV["RACK_ENV"] = "test"

require 'capybara/rspec'
require 'capybara'
require 'rspec'
require 'database_cleaner'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative '../app/app.rb'
require 'simplecov'
require 'simplecov-console'
require 'pry'
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  #
  # DataMapper.setup(:default,'postgres://localhost/chitter_test')
  # DataMapper.finalize


  config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

end
