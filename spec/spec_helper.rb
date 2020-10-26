ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'setup_test_database'
require 'simplecov'
require 'simplecov-console'
require 'web_helpers'
require 'database_helpers'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = Chitter

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  config.before(:each) do
    wipe_test_database
  end
end
