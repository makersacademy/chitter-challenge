
ENV['ENVIRONMENT'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'sinatra/flash'

require './lib/database_connection'
require_relative './setup_test_database'
require './lib/peep'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:each) do
    setup_test_database
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
