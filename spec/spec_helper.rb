require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require 'database_connection'
ENV['ENV'] = 'test'
DatabaseConnection.connect

RSpec.configure do |config|
  def reset_all_tables
    sql = File.read('./spec/seeds_tables.sql')
    connection = PG.connect({
      host: 'localhost', dbname: 'chitter_test',
      user: 'postgres', password: ENV['PGPASSWORD']
    })
    connection.exec(sql)
  end

  config.before(:each) do
    reset_all_tables
  end

  config.after(:suite) do
    reset_all_tables
    puts "\e[33mUse Rubocop to improve your code! Just run: rubocop\e[0m"
  end
end
