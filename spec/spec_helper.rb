ENV['RACK_ENV'] = 'test'

# Bring in the contents of the `application_controller.rb` file
require_relative '../app/onlyphans'

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'pg'
require 'rake'
require 'rspec'

Capybara.app = ApplicationController

require 'simplecov'
require 'simplecov-console'

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
