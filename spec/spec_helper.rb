ENV['RACK_ENV'] = 'test'

require './app'
require_relative 'support/database_helper'
require_relative 'support/web_helper'
require 'capybara'
require 'capybara/rspec'
require 'rake'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])

SimpleCov.start do
  add_filter "Rakefile"
end

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['clear_test_database'].execute
  end

  config.include DatabaseHelper

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
