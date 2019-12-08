require 'simplecov'
require 'simplecov-console'

require 'setup_test_db'

# Require app.rb
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# Specify the Capybara app
Capybara.app = Chitter

# Set environment variable
ENV['RACK_ENV'] = 'test'

# Run #setup_db method before each
RSpec.configure do |config|
  config.before(:each) do
    setup_db
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
