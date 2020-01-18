require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app'
require 'database_helpers'
require './lib/database_connection'
require_relative './features/web_helpers'

Capybara.app = ChitterApp

ENV['RACK_ENV'] = 'test'


RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  config.before(:each) do
    setup_test_database
  end
  
end
