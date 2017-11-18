ENV['RACK_ENV'] = 'test'

#require './models/link.rb'
#require './models/tag.rb'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'database_cleaner'
require_relative '../app/app.rb'
require_relative './features/web_helpers.rb'



Capybara.app = Chitter
#DatabaseCleaner.strategy = :truncation

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start


RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
