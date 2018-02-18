ENV["RACK_ENV"] = 'test'

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'rake'
require_relative './../app.rb'
require_relative './../database_setup'
require_relative './features/web_helpers'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Rake.application.load_rakefile

Capybara.app = Chitter

RSpec.configure do |config|
  config.before :each do
    Rake::Task[:populate_test_database].invoke
    Rake::Task[:populate_test_database].reenable
  end
end

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
