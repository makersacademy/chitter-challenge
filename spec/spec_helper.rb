ENV['RACK'] = 'test'

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app.rb'
require 'pg'
require_relative './features/web_helpers'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    connection = PG.connect(dbname: 'Chitter_test')
    connection.exec("TRUNCATE peeps;")
    connection2 = PG.connect(dbname: 'Chitter_Users_Test')
    connection2.exec("TRUNCATE users;")
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
