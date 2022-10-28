require 'simplecov'
require 'simplecov-console'
require_relative './../app'
require 'user'
require 'user_repository'
require 'message'
require 'message_repository'
require 'database_connection'
require "rack/test"
require 'erb'

DatabaseConnection.connect('chitter_test')

def reset_tables
  message_sql = File.read('seeds/seeds_messages.sql')
  user_sql = File.read('seeds/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(user_sql)
  connection.exec(message_sql)
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do 
    reset_tables
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
