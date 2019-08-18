ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require_relative '../app.rb'
require_relative '../spec/db_helper.rb'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rake'

require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# Load rake file for database tasks
rake = Rake.application
rake.load_rakefile

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  config.before(:each) do
    rake['rebuild_test_db'].execute
  end

end
