# require 'simplecov'
# require 'simplecov-console'
#
# SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
#   SimpleCov::Formatter::Console,
#   # Want a nice code coverage website? Uncomment this next line!
#   # SimpleCov::Formatter::HTMLFormatter
# ])
# SimpleCov.start
require_relative './setup_test_database'
# RSpec.configure do |config|
#   config.after(:suite) do
#     puts
#     puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
#     puts "\e[33mTry it now! Just run: rubocop\e[0m"
#   end
# end
# at the top of spec/spec_helper.rb
# require_relative './setup_test_database'
# Set the environment to "test"
ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', './app/app.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app/app.rb'

Capybara.app = Chitter

### the rest of the file ###
