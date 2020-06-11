require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

# ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

require 'simplecov'
require 'simplecov-console'
require_relative 'setup_test_database'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# require app.rb
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# configure capybara app
Capybara.app = Chitter


RSpec.configure do |config|
  config.after(:suite) do
    motivation = [
      'You go girl!',
      'Drink water!',
      'aaaand breathe',
    ].sample
    puts
    puts "\e[33m#{motivation}\e[0m"
  end
end
