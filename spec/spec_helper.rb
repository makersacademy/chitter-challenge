# require_relative './setup_test_database'

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app', 'app.rb')


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

Capybara.app = Peep

# RSpec.configure do |config|
#   config.before(:each) do
#     setup_test_database
#   end
# end
#
#
# require 'capybara'
# require 'capybara/rspec'
# require 'rspec'
#
# Capybara.app = BookmarkManager
