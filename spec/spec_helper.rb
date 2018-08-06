ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require_relative './setup_test_database.rb'
require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'rspec'
require 'features/web_helpers'
# require './spec/features/web_helpers.rb'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.after(:suite) do
    puts "Youre amazing, keep it up!"
  end
end
