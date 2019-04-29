require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'

require(File.join(File.dirname(__FILE__), '..', 'app.rb'))

ENV['RACK_ENV'] = 'test'

Capybara.app = Chitter

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

ENV['ENVIRONMENT'] = 'test'

require_relative "./setup_test_database"

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
