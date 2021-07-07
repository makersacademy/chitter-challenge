
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'database_connection'
require 'capybara/rspec'
require 'pry'
require './app/chitter_app'

Capybara.app = Chitter

ENV['RACK'] = 'test'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

RSpec.configure do |config|
  config.before(:each) do
    DatabaseConnection.setup('chitter_test')
    DatabaseConnection.query('TRUNCATE TABLE users, peeps')
  end
end
