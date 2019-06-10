require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rspec-html-matchers'
require 'simplecov'
require 'simplecov-console'
require 'timecop'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require_relative './setup_test_database'

# Set the environment to "test"
ENV['ENVIRONMENT'] = 'test'
ENV['RACK-ENV'] = 'test'

# tell capybara to talk to Chitter
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.include RSpecHtmlMatchers
  config.before(:each) do
    setup_test_database
  end
  # config.after(:suite) do
  #   puts
  #   puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
  #   puts "\e[33mTry it now! Just run: rubocop\e[0m"
  # end
end
