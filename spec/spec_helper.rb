ENV['ENVIRONMENT'] = 'test'
require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app.rb')
# require 'features/web_helpers.rb'
require 'capybara'
require 'rspec'
require_relative './features/setup_test_database'
require_relative './features/database_helpers'

Capybara.app = Chitter
ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|

  config.before :each do
    setup_test_database
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
