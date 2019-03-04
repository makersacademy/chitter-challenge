ENV["RACK_ENV"] = 'test'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
# require 'features/web_helper'
require './app.rb'
require 'features/db_helper'

Capybara.app = Chitter

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
  config.before(:each) do
    clear_test
  end
  config.after(:each) do
    clear_test
  end
end
