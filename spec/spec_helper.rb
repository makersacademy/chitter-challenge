require 'capybara/rspec'
require 'orderly'
require 'simplecov'
require 'simplecov-console'
require 'web-helpers'
require './chitter'

ENV['RAILS_ENV'] = 'test'
TIMESTAMP_REGEX = '\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} UTC'
TEST_MESSAGE = "Hey @al123, how are you?"

Capybara.app = Chitter

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

Mail.defaults do
  delivery_method :test
end

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
