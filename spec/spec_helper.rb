require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start


require 'capybara'
require 'sinatra'
require 'capybara/rspec'
require 'rspec'
require 'rake'

require_relative './../app.rb'
require 'database_helper'

Capybara.app = Chitter

# Setting the environment to test

ENV['RACK_ENV'] = 'test'



RSpec.configure do |config|

  config.before(:each) do 
    test_database_setup
  end 

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
