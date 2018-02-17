ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rake'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

Rake.application.load_rakefile

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task[:setup].execute
    Rake::Task[:setup_test_database].execute
  end
end
