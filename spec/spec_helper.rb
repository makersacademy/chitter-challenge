require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require './app'
require 'capybara'
require 'rspec'
require 'pry'
require_relative 'web_helper'

Capybara.app = Chitter
ENV['TEST_DATABASE'] = 'chitter_test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  DataMapper::setup(:default, "postgres://localhost:5432/#{ENV['TEST_DATABASE']}")
  DataMapper.finalize
end

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
