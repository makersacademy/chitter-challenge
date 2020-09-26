require_relative 'database_helpers'

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

Capybara.app = Chitter


RSpec.configure do |config|

=begin 
  config.before(:each) do
    truncates
  end
=end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
