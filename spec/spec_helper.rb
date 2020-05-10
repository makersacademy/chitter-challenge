require 'capybara/rspec'
require 'database_cleaner/active_record'
require 'simplecov'
require 'simplecov-console'
require 'support/database_cleaner.rb'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  ENV['RACK_ENV'] = 'development'
  
  require File.join(File.dirname(__FILE__), '..', 'app.rb')
  Capybara.app = Chitter
  
  # require 'features/web_helpers'
  
end
