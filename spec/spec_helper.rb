require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

RSpec.configure do |config|
  config.before(:each) do
    require_relative './test_database_setup'
  end
end

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
