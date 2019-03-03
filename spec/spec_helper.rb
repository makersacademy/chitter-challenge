ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
# require 'pg'
require 'simplecov'
require 'simplecov-console'
require 'rspec'
# require './app.rb'
# require 'features/web_helpers'
Capybara.app = Chitter

require_relative './setup_test_db'
ENV['ENVIRONMENT'] = 'test'
RSpec.configure do |config|
  config.before(:each) do
    # setup_test_db
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
