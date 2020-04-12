ENV['ENVIRONMENT'] = 'test' 

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# require app.rb
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# test helper methods
require 'features/web_helpers'

# database cleanup
require_relative 'setup_test_database'

# configure capybara app
Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.after(:suite) do
    motivation = [
      'Red Green Refactor!',
      'Commit after each RGR cycle!',
      'Focus on the simplest problem!',
      'Only change code to pass tests!',
    ].sample
    puts
    puts "\e[33m#{motivation}\e[0m"
  end
end
