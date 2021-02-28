# require 'simplecov'
# require 'simplecov-console'
ENV['RACK_ENV'] = 'test'
# require our Sinatra app file
require File.join(File.dirname(__FILE__), '..', 'app.rb')
# require './app'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'feature_tests/web_helpers'
require 'setup_test_database'
require 'peep'
require 'user'
require 'login'
Capybara.app = Chitter_app

def add_demo_peeps
  Peep.add_new('This is my test peep', 'James')
  Peep.add_new('This is another peep', 'Freddie')
end

def add_demo_users
  User.add_new('James', 'password123')
  User.add_new('Fred', 'password321')
end
# SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
#   SimpleCov::Formatter::Console,
#   # Want a nice code coverage website? Uncomment this next line!
#   # SimpleCov::Formatter::HTMLFormatter
# ])
# SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
