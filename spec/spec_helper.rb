require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require_relative '../app'

ENV['ENVIRONMENT'] = 'test'

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

  config.before :each do
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("truncate chitter")
  end
end
