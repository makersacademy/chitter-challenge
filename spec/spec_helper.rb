require 'rake'

# Set the environment to "test"
ENV['ENVIRONMENT'] = 'test'

# ENV['RACK_ENV'] = 'test'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

# Tell Capybara to talk to Chitter
Capybara.app = Chitter
# Load the Rakefile
Rake.application.load_rakefile
Rake::Task['test_database_population'].execute

# RSpec.configure do |config|
#   config.before(:each) do
#     # require_relative './test_database_setup'
#     Rake::Task['test_database_population'].execute
#   end
# end

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
