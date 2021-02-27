require 'coveralls'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])

SimpleCov.start
Coveralls.wear!

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV']    = 'test'

require 'capybara'
require 'capybara/rspec'
require 'pg'
require 'rake'
require 'rspec'

require_relative 'features/web_helpers'
require_relative '../app/chitter'

Capybara.app = Chitter

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:each) { Rake::Task['clean_test_database'].execute }
  config.before(:suite) { Rake::Task['setup_database_connection'].execute }
end
