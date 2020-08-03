require 'capybara'
require 'rspec'
require 'pg'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative './set_up_chitter_test'

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Chitter

Rspec.configure do |config|
  config.before(:each) do
    set_up_chitter_test
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
