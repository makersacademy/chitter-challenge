ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require './app.rb'
require 'helper.rb'
require 'dm-rspec'
require 'orderly'

Capybara.app = ChitterApp

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.include(DataMapper::Matchers)
  config.before(:suite) do
    truncate_and_add_3_peeps
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
