ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'factory_girl'
require 'test-helpers/wait'


# Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"

  end

  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #    DatabaseCleaner.clean_with(:truncation)
  # end
  #
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
  #
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end

  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include TestHelpers
end
