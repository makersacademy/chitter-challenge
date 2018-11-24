require 'simplecov'
require 'simplecov-console'
require_relative './setup_test_database'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start


ENV['ENVIRONMENT'] = 'test'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# Tell Capybara to talk to BookmarkManager
Capybara.app = Chitter

# require_relative './'



RSpec.configure do |config|
  config.before(:suite) do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(15) UNIQUE, email VARCHAR(40) UNIQUE, password VARCHAR(10), name VARCHAR(15));")
    connection.exec("CREATE TABLE messages(id SERIAL PRIMARY KEY, message VARCHAR(160), time TIMESTAMP);")
    connection.exec('ALTER TABLE messages ADD COLUMN username VARCHAR(15);')
    connection.exec('ALTER TABLE messages ADD COLUMN name VARCHAR(15);')
    connection.exec('ALTER TABLE "messages" ADD COLUMN time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;')
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
