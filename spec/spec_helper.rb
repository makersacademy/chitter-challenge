# need simple cov and simple cov console at the very top of the spec heler i.e. to line 9. 
require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
# DONT CHANGE ANYTHING ABOVE THIS LINE - needed to generate tests when pulled into travis for auto test. 

# this sets the environment up as test when RSpec is run. 
ENV['RACK_ENV'] = 'test'

# this brings in the contents of the app.rb file so it can be tested.
require File.join(File.dirname(__FILE__), '..', 'app.rb')

#requiring the gems that we need to use to run the tests. 
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# this tells the Capybara tool to talk to the Chitter programme. 
Capybara.app = Chitter

# configuring the tests. 
RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
