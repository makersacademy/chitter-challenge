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
require_relative '../app/app'

Capybara.app = Chitter

BCrypt::Engine.cost = 1

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:suite) { Rake::Task['db:connect'].execute }
  config.before(:each) { Rake::Task['db:clean'].execute }
end
