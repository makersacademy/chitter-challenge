ENV['ENV_TEST'] = 'test'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'
require 'orderly'
require_relative '../app.rb'
require_relative './features/web_helpers'
require_relative './setup_test_data'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = Chitter

RSpec.configure do |config|

  config.before(:each) do
    setup_test_database
  end

  config.after(:suite) do
    puts "Don't forget rubocop"
  end
end
