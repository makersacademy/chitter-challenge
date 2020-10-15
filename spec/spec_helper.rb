require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# Environment variable MUST be set before app.rb is required
ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'pry'

require 'test_database_manager'
require './app'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    truncate_test_db
  end
  
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
