# need to require this file to setup the test database so it can be cleared once tests run. 
require_relative './setup_test_database'

# need simple cov and simple cov console at the very top of the spec heler to enable travis at git pull
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# this sets the environment up as test when RSpec is run. It caught me out as was RACK_ENV which misled.
ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
# DONT CHANGE ANYTHING ABOVE THIS LINE - needed to generate tests when pulled into travis for auto test. 

# this brings in the contents of the app.rb file so it can be tested.
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# this tells the Capybara tool to talk to the Chitter programme. 
Capybara.app = Chitter

=begin 
This caused me a headache as I was stuck in a real dev env, not the test env.
The before each uses the setup_test_database! 
=end
RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

# configuring the tests... afterwards. 
RSpec.configure do |config|
  config.after(:suite) do
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
