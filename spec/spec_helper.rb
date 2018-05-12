ENV['RACK_ENV'] = 'test'

# Gems required
require 'pg'
require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

# Project files required
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require_relative 'helpers'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before do
    @connection = PG.connect(dbname: 'chitter_test')
    empty_database
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
