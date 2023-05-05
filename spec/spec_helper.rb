require 'simplecov'
require 'simplecov-console'
require 'database_connection'

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

ENV['ENV'] = 'test'
DatabaseConnection.connect

def reset_peeps_table
  sql_seeds = File.read('spec/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(sql_seeds)
end

def reset_users_table
  sql_seeds = File.read("spec/seeds_users.sql")
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec sql_seeds
end
