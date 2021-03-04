require 'coveralls'

Coveralls.wear!
SimpleCov.start

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  SimpleCov::Formatter::Console
)

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

BCrypt::Engine.cost = 1

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:suite) { Rake::Task['setup_database_connection'].execute }
  config.before(:each) { Rake::Task['clean_test_database'].execute }
end
