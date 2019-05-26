ENV['ENVIRONMENT'] = 'test'

# require our Sinatra app file
require 'simplecov'
require 'simplecov-console'
# require our Sinatra app file
require_relative '../app'
require 'features/setup_test_db'
require 'capybara/rspec'

# tell Capybara about our app class
Capybara.app = ChitterFeed

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_db
  end 
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

