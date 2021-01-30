require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require './app.rb'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['Rack ENV'] = 'test'
Capybara.app = Chitter

RSpec.configure do |config|

end
