require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'helper_methods.rb'
require 'orderly'
require 'timecop'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
   SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
  config.after :each do
    Capybara.reset_sessions!
  end
end

# as I understand, this allows testing to locate app and run in tests
require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = Chitter

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'
