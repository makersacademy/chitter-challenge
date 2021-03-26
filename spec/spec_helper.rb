require 'simplecov'
require 'simplecov-console'
ENV['DATABASE']='test'
require_relative "../app"
require 'capybara'
require 'capybara/rspec'
require 'rspec'
#require_relative 'helper_methods'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
Capybara.app = Chitter

RSpec.configure do |config|
  # config.before(:each) do
  #   clear_table
  # end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
