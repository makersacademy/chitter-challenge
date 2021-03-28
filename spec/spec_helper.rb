ENV['RACK_ENV'] = 'test'
ENV['DB_ENV'] = 'test'

# require File.join(File.dirname(__FILE__), '..', 'app.rb')
require_relative '../app.rb'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require_relative '../db_connection_setup'
require_relative './setup_test_db'
# require_relative '../lib/db'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

setup_test_db

RSpec.configure do |config|
  # config.before(:each) do
  #   setup_test_db
  # end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
