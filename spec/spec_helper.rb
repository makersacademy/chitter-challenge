
#capybara talking to Sinatra
ENV['ENVIRONMENT'] = 'test'
require 'capybara/rspec'
require 'rspec'
require 'pg'
require 'simplecov'
require 'simplecov-console'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

SimpleCov.start



group :test do
  require 'rspec'
  require 'cucumber'
  require 'rubocop-rspec'
  require 'coveralls',require: false
  group :development, :test do
  gem "rubocop", "0.79.0"
end



Capybara.app = ChitterChallenge #any instructions like visit('/') should be directed at the application called ChitterChallenge

RSpec.configure do |config|
	 config.before(:each) do
 		 setup_test_database!
 	end
end

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
end
