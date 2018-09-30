ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'pry'
require 'rake'
require 'simplecov'
require 'simplecov-console'
require_relative '../database_connection_setup'
require_relative '../app.rb'
require_relative 'features/web_helpers'
require_relative 'helper_methods'

Capybara.app = ChitterApp

initialize_test_database

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:suite) do
    Rake::Task['setup'].execute
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
