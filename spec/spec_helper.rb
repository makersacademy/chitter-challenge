# file: spec/spec_helper.rb
require 'database_connection'
require 'simplecov'
require 'simplecov-console'

# Make sure this connects to your test database
# (its name should end with '_test')
DatabaseConnection.connect('chitter_chatter_test')

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start