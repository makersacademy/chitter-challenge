ENV['ENVIRONMENT'] = 'test'

require 'simplecov'
require 'simplecov-console'
require_relative '../app.rb'
require_relative './setup_test_database'

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) { clear_database }
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
