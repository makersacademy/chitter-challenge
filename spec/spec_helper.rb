
require 'database_helpers'
require 'features/web_helpers'
# Set the environment to "test"
ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'
# Bring in the contents of the `app.rb` file. The below is equivalent to: require_relative '../app.rb'
require File.join(File.dirname(__FILE__), '..', 'app.rb')


require 'rake' 
Rake.application.load_rakefile #ask Rake to load the Rakefile
# Rake tast to setup test database before each test: 
RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end
end

# alteratively to rake, we were previously using the setup_test_database file and instructing rspec to run the script inside it before each test
# RSpec.configure do |config|
#   config.before(:each) do
#     setup_test_database
#   end
# end

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

require 'simplecov'
require 'simplecov-console'

# Tell Capybara to talk to Chitter
Capybara.app = Chitter
 


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
