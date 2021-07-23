ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require 'pg'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console, SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
end
