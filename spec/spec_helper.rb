ENV['ENVIRONMENT'] = 'test'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rake'
Rake.application.load_rakefile
require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task["setup_test_database"].execute
  end
end
