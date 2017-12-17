require 'simplecov'
require 'simplecov-console'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require_relative '../app/app.rb'
require './app/models/peep.rb'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do

  end
end
