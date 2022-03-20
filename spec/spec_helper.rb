require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative 'db_setup'

RSpec.configure do |config|
  config.before(:each) do
    truncate_db
  end

  config.after(:suite) do
    puts
    puts "\e[33mRubocop it!\e[0m"
  end
end
