require 'simplecov'
require 'simplecov-console'
require 'database_connection'

ENV['ENV'] = 'test'
DatabaseConnection.connect

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "[33mHave you considered running rubocop? It will help you improve your code![0m"
    puts "[33mTry it now! Just run: rubocop[0m"
  end
end
