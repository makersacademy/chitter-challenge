ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'
require_relative './setup_test_database'
require File.join(File.dirname(__FILE__), '..', './app/chitter_app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rake'


RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

Capybara.app = Chitter

require 'simplecov'
require 'simplecov-console'

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
