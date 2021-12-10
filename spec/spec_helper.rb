require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require File.join(File.dirname(__FILE__),'../app/app.rb')

ENV['RACK_ENV'] = 'test'

Capybara.app = ChitterApp

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
