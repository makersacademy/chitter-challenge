require 'simplecov'
require 'simplecov-console'

require 'capybara/rspec'
require 'pg'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'rspec'
require './app'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

ENV['RACK_ENV'] = 'test'
# Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::Console
  ]
)
SimpleCov.start
#
# RSpec.configure do |config|
# config.before(:each) do
#   connection = PG.connect(dbname: 'bookmark_manager_test')
#   connection.exec("TRUNCATE bookmarks;")
# end
# end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
