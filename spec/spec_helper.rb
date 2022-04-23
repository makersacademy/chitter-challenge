ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'timecop'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# require_relative '../app'
require_relative './setup_test_database'

Capybara.app = ChitterWeb

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.before(:suite) do
    Timecop.freeze(Time.now)
  end

  config.after(:suite) do
    Timecop.return

    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
