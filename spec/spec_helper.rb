# require 'simplecov'
# require 'simplecov-console'
#
# SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
#   SimpleCov::Formatter::Console,
#   # Want a nice code coverage website? Uncomment this next line!
#   # SimpleCov::Formatter::HTMLFormatter
# ])
# SimpleCov.start
#
# RSpec.configure do |config|
#   config.after(:suite) do
#     # puts
#     # puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
#     # puts "\e[33mTry it now! Just run: rubocop\e[0m"
#   end
# end
ENV["RACK_ENV"] = "test"
# imports the actual controller file
require_relative "../App/Controllers/application_controller"

require "rspec"
require "capybara"
require "capybara/rspec"

# tells Capybara what the app is for the feature tests
Capybara.app = ApplicationController