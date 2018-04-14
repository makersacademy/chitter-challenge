require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require 'capybara'
require 'rspec'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

ENV['RACK_ENV'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = Chitterapp

RSpec.configure do |config|

  config.before(:each) do
    allow(ENV).to receive(:[]).with("DB").and_return("chitter_test")
    load './setup_test_database.rb'
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

end
