require 'simplecov'
require 'simplecov-console'

SimpleCov.start do
  add_filter '/spec'
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])

ENV['RACK_ENV'] = 'test'

require './app/app'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner/active_record'
require 'rspec'
require 'helpers/signup_helper'
require 'helpers/login_helper'
require 'helpers/peep_helper'

Capybara.app = Chitter

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
