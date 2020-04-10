require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rake'
require 'simplecov'
require 'simplecov-console'
require File.join(File.dirname(__FILE__), '..', 'chitter.rb')
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['ENVIRONMENT'] = 'test'
Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['clean_test_db'].execute
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
