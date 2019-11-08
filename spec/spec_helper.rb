ENV['ENVIRONMENT'] = 'test'
require File.expand_path '../../app.rb', __FILE__
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
Capybara.app = Chitter


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
