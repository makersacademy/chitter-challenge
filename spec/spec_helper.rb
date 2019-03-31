require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require_relative 'database_helpers'
require_relative 'web_helpers'

ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.after(:suite) do
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  config.before(:each) { test_db_setup }

  ENV['RACK_ENV'] = 'test'

  require File.join(File.dirname(__FILE__), '..', 'app.rb')
  Capybara.app = ChitterApp
end
