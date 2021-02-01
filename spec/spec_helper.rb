require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require './app.rb'

require_relative 'db_helpers'
require_relative 'web_helpers'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['Rack ENV'] = 'test'
Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    truncate_table(table: 'peep')
    truncate_table(table: 'chitterer')
  end
end
