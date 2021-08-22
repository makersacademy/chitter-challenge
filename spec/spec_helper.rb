require 'active_record'
require 'sinatra'
require 'capybara'
require 'capybara/rspec'
require 'require_all'

ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require_all 'app'

configuration = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(configuration['test'])

Capybara.app = ApplicationController
