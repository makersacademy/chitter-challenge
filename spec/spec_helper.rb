ENV['ENVIRONMENT'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')


require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'launchy'
require 'rspec'
require 'pg'
require 'simplecov-console'
require './spec/helper_methods'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
Capybara.app = Chitterapp
RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end


RSpec.configure do |config|
  config.before(:each) do
    truncate_test_db
  end
end
