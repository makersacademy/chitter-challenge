ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'capybara/rspec'
require 'pg'
require 'simplecov'
require 'simplecov-console'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    con = PG.connect(dbname: 'chitter_test')
    con.exec("TRUNCATE TABLE peeps;")
    con.exec("INSERT INTO peeps (message, makerid, createstamp) VALUES ('The first ever peep', NULL, '2019-03-02 12:10:40.790703');")
    con.exec("INSERT INTO peeps (message, makerid, createstamp) VALUES ('The second ever peep', NULL, '2019-03-02 12:12:40.790703');")
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
