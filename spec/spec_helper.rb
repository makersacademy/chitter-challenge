require 'capybara'
require 'capybara/rspec'
require 'pry'
require 'rspec'
require 'sinatra/reloader'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require_relative './clear_test_database'
require_relative './sign_up_user'
require_relative './clear_peeps'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    clear_test_database
    clear_peeps
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
