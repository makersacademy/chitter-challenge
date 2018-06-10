ENV['RACK_ENV'] = 'test'
ENV['ENVIROMENT'] = 'test'
# use the contents of the app.rb file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# this is for checking code coverage
require 'simplecov'
require 'simplecov-console'

# These are the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'setup_test_database'
# Tell capybara to talk to Chitter
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:each) do
    setup_test_database!
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
