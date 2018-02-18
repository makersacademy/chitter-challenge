ENV['ENVIRONMENT'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require 'rspec'
require 'rake'

# Load the Rakefile
Rake.application.load_rakefile

# Then, in the RSpec config...
RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['populate'].execute
  end
end

# This allows the app to run. It requires 'capybara/rspec' and 'path_to_app'
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
