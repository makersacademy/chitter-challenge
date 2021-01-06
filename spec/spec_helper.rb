require 'simplecov'
require 'simplecov-console'
require 'sinatra'
require 'capybara/rspec'
require_relative '../app.rb'
require_relative './features/web_helper.rb'


Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  ENV["Environment"] = 'test'

  config.before(:each) do
    begin
      con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      rs = con.exec "TRUNCATE TABLE users, peeps restart IDENTITY"

      rescue PG::Error => e

      puts e.message

      ensure

      con.close if con
    end
  end

  config.after(:suite) do
    # puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
