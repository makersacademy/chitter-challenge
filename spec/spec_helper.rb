# required gems
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'

# require controller file
require_relative '../app'

# set rack environment
ENV['RACK_ENV'] = 'test'

# Set up test environment for datatbases
ENV['Environment'] = 'test'

# Tell capybara to talk to Chitter
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  # config.after(:suite) do
  #   puts
  #   puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
  #   puts "\e[33mTry it now! Just run: rubocop\e[0m"
  # end
end
