require 'capybara'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

ENV['ENVIRONMENT'] = 'test'

require 'capybara/rspec'
require_relative 'test_database.rb'
require './app/app'

require File.join(File.dirname(__FILE__), '..', './app/app.rb')

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  
  config.before(:each) do
    test_database!
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

end
  