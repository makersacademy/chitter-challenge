require 'simplecov'
require 'simplecov-console'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# Bring in the contents of the `app.rb` file.
require_relative '../app/app'

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'pg'
require 'rspec'

#require_relative 'web_helper.rb'
require_relative './support/database_cleaner.rb'

# Tell Capybara to talk to Chitter
Capybara.app = Chitter

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
