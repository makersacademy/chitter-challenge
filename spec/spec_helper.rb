ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require './app.rb'

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Chitter

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require './spec/helper.rb'

RSpec.configure do |config|
  config.before(:each) do
    setup_tables
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
