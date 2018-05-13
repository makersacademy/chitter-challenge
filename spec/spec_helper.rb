ENV['ENVIRONMENT'] = 'test'

require './app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rake'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require_relative './setup_test_database'

# Load the Rakefile
Rake.application.load_rakefile

# Then, in the RSpec config...
RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['setup_test_database'].execute
  end
  config.after(:each) do
    Rake::Task['setup_test_database'].execute
  end
end

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
