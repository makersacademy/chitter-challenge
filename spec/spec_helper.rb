require 'simplecov'
require 'simplecov-console'


ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Chitter

#Rake.application.load_rakefile

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start


# RSpec.configure do |config|
#   config.before(:each) do
#     Rake::Task[:setup_test_database].execute
#   end
# end
