require 'rake'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Rake.application.load_rakefile

RSpec.configure do |config|

  # config.before(:suite) do
  #   Rake::Task['setup'].execute
  #   conn = PG.connect(dbname: 'chitter_test')
  #   conn.exec("CREATE TABLE users(first_name VARCHAR, last_name VARCHAR, email VARCHAR UNIQUE, username VARCHAR UNIQUE, password VARCHAR, user_id SERIAL PRIMARY KEY);")
  #   conn.exec("CREATE TABLE peeps(user_id INT4, content VARCHAR, time TIMESTAMP, post_id SERIAL PRIMARY KEY);")
  # end

  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

require 'capybara'
require 'capybara/rspec'
require 'rspec'

ENV['RACK_ENV'] = 'test'

# require our Sinatra app file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = ChitterApp
