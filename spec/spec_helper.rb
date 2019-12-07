# Require all the testing gems
require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require 'capybara'
require 'rspec'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

ENV['ENVIRONMENT'] = 'test'

# Set the environment to "test"
require_relative './setup_test_database'

# Tell Capybara to talk to Chitter
Capybara.app = Chitter

RSpec.configure do |config|

  config.before(:each) do
    setup_test_database
  end
end

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
