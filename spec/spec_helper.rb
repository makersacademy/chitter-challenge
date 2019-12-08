ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require './app.rb'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'
require './lib/peep.rb'
require 'setup_test_database'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.backtrace_exclusion_patterns = [/gems/]
  
  config.before(:each) do
    setup_test_database
  end
end


