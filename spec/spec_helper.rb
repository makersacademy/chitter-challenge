require 'simplecov'
require 'simplecov-console'

#Added
require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/app.rb'
require 'capybara/rspec'
Capybara.app = ChitterManager

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
end
#Test comment
