ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', './app/app.rb')

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
SimpleCov::Formatter::Console,
SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

end
