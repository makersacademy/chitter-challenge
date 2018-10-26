ENV['ENVIRONMENT'] = 'test'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'helper_methods'
require 'pry'
require_relative './../app'
require_relative './helper_methods'
Capybara.app = Rack::Builder.parse_file('config.ru').first

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
    reset_users
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
