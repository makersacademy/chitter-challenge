require 'rake'
# Load the Rakefile
# Rake.application.load_rakefile
#
# # Then, in the RSpec config...
# RSpec.configure do |config|
#   config.before(:each) do
#     Rake::Task['setup'].execute
#   end
# end
require 'simplecov'
require 'simplecov-console'
require 'setup_test_database'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start do
  add_filter "lib/database_connection_setup.rb"
end


ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
require File.join(File.dirname(__FILE__), '..', './lib/app.rb')
# require '/Users/Student/projects/challenges/chitter-challenge/lib/app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = PeepManager
