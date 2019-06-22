require File.join(File.dirname(__FILE__), '../app/', 'app.rb')
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app  = ChitterApp

RSpec.configure do |config|
  config.after(:suite) do
  end
end
