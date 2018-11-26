ENV['ENVIRONMENT'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative './setup_test_database'

Capybara.app = ChitterChatter

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:suite) do
    connection = PG.connect(dbname: 'chitter_chatter_test')
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email  VARCHAR(60), password VARCHAR(140), name VARCHAR(60));")
    connection.exec("CREATE TABLE messages(id SERIAL PRIMARY KEY, body VARCHAR, title VARCHAR);")
    connection.exec("ALTER TABLE messages ADD COLUMN created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;")
  end

  config.before(:each) do
    setup_test_database
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
