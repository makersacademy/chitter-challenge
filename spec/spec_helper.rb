require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

ENV['ENVIRONMENT'] = 'test'
#Set the environment to "test"

require File.join(File.dirname(__FILE__), '..', 'app.rb')
#Bring in the contents of the 'app.rb' file

require 'capybara'
require 'capybara/rspec'
require 'rspec'
#require all the testing gems

Capybara.app = Peeps
#Tell Capybara to talk to Peeps
