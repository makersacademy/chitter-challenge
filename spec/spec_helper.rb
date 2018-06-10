ENV['ENVIRONMENT'] = 'test'
require 'rake'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end
end
