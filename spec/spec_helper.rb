ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'
require 'simplecov'
require 'simplecov-console'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require 'bcrypt'
require 'database_cleaner'
require 'capybara/rspec'
# require 'capybara-screenshot/rspec'
require 'capybara'
require 'rspec'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = Chitter
require 'capybara/dsl'
require 'timecop'
require_relative './features/web_helpers.rb'


# Capybara.default_driver = :selenium
DatabaseCleaner.strategy = :truncation

#should include capybara DSL in Rspec.configure
RSpec.configure do |config|

  config.include Capybara::DSL
  config.before(:all) do
    DatabaseCleaner.clean
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
