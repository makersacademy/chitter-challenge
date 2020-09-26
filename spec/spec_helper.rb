ENV['ENVIRONMENT'] ='test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require_relative './database_setup'
require_relative './features/web_helpers'

require 'simplecov'
require 'simplecov-console'
require 'rspec'
require 'capybara/rspec'
require 'capybara'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do 
    database_setup
  end 
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
