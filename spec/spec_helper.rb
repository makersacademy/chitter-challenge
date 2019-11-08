require 'simplecov'
require 'simplecov-console'
require 'simplecov-lcov'

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
SimpleCov::Formatter::LcovFormatter.config.lcov_file_name = 'lcov.info'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
  SimpleCov::Formatter::LcovFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

ENV['RACK_ENV'] = 'test'

require_relative 'setup_test_database'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

require File.join(File.dirname(__FILE__), '..', 'chitter.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Chitter
