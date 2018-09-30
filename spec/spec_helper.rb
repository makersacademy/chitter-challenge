ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

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
require 'data_mapper'
require 'rspec'
require_relative 'helper.rb'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Chitter
# DataMapper::Logger.new($stdout, :debug)

require './lib/dm-psql'

RSpec.configure do |config|
  config.before(:each) do
    initialise_test_database
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
