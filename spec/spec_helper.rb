ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'pry'
require 'rspec'
require 'database_cleaner'
require_relative 'web_helpers'
require_relative '../app'
require_relative '../models/user'
require_relative '../models/peep'
require_relative '../data_mapper_setup'

DatabaseCleaner.strategy = :truncation

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
