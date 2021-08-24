ENV['RACK_ENV'] = 'test' 

require 'simplecov'
require 'simplecov-console'
require "capybara"
require "capybara/rspec"
require "rspec"
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require './lib/cheet.rb'
require 'web_helper'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  
  config.before(:each) do 
    conn = PG.connect dbname: "chitter_test"
    conn.exec("TRUNCATE cheets;")
    conn.exec("TRUNCATE users;")
  end 

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
