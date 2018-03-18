ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rake'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter
Rake.application.load_rakefile

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task[:test_setup].execute
  end

  config.after(:suite) do
    puts "\e[33mHave you considered running rubocop?"
    puts "\e[33mIt will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
