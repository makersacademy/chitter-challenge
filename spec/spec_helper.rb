ENV['ENVIRONMENT'] = 'test'

require 'simplecov'
require 'simplecov-console'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'orderly'

# Require Rake
require 'rake'

# require  Sinatra app file
require_relative '../app'

# require helpers
require_relative './features/web_helpers'
require_relative './model_helpers'

# tell Capybara about the app class
Capybara.app = Chitter

# Load the Rakefile
Rake.application.load_rakefile

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop?\e[0m"
  end

  
end
