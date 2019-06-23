require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app'
require 'pg'
require 'simplecov'
require 'simplecov-console'

require File.join(File.dirname(__FILE__), '..', './app')

ENV['EVIRONMENT'] = 'test'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
