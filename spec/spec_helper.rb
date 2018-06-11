require 'pg'
require 'rake'

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

Rake.application.load_rakefile

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'features/feature_web_helpers'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

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
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
