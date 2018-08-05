require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'web-helper'
require 'date'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['ENVIRONEMNT'] = 'test'

RSpec.configure do |config|
  config.before(:each) { setup_test_database }
end

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = App

RSpec.configure do |config|
  config.after(:suite) do
    puts "\e[35m---------------------------------------------------\e[0m"
    puts "\e[33mRobotests Processing....\e[0m"
    puts "\e[34mJack is cool\e[0m"
  end
end
