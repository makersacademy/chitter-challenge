require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  ENV['ENVIRONMENT'] = 'test'

  require File.join(File.dirname(__FILE__), '..', 'app.rb')

  Capybara.app = ChitterApp
end
