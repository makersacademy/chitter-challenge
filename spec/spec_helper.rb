ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

# require our Sinatra app file
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'pg'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

# tell Capybara about our app class
Capybara.app = ChitterChallenge

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:suite) do
    p "setting up test database"
    connection = PG.connect(dbname: 'peep_manager_test')
    connection.exec('TRUNCATE peeps;')
  end

    config.before(:suite) do
      p "setting up test database"
      connection = PG.connect(dbname: 'user_manager_test')
      connection.exec('TRUNCATE users;')
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end


