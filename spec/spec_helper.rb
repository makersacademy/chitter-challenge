# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])
# Want a nice code coverage website? Uncomment this next line!
# SimpleCov::Formatter::HTMLFormatter
SimpleCov.start

# You can see your test coverage when you run your tests.
# If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!

# Set the environment to "test"
# ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

# RSpec.configure do |config|
#   config.before(:each) do
#     setup_test_database
#   end
# end

# Bring in the contents of the `app.rb` file. It is equivalent to: require_relative '../app.rb'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# Tell Capybara to talk to Chitter
Capybara.app = Chitter
