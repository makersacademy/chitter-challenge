require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
ENV['ENVIRONMENT'] = "test"
RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  ENV['RACK_ENV'] = 'test'
  require_relative '../app.rb'
  require 'capybara'
  require 'capybara/rspec'
  require 'rspec'
  

  Capybara.app = Chitter
end
