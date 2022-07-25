ENV['CHITTER_ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'pg'
require './database_connection_setup'
require './spec/features/web_helpers'

SimpleCov.start

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Chitter

RSpec.configure do |config|

  config.before(:each) do 
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("TRUNCATE TABLE peeps;")
    connection.exec("TRUNCATE TABLE sign_up;")
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
