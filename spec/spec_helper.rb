ENV['ENVIRONMENT'] = 'test'

require 'simplecov'
require 'simplecov-console'
require 'pg'
require 'sinatra'
require 'capybara'
require 'capybara/rspec'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require_relative './database_clear.rb'

Capybara.app = ChitterApp

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

RSpec.configure do |config|
  config.before(:each) do
    clean_peep_db
    clean_user_db
  end
end
