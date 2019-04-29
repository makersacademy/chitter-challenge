ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require './app.rb'
require './spec/signup_helper.rb'

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = ChitterManager

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    DatabaseConnection.execute("TRUNCATE users, peeps;")
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
