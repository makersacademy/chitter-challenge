require 'simplecov'
require 'simplecov-console'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# sets the environment to test database
ENV["RACK_ENV"] = "test"


RSpec.configure do |config|
  # This resets the database tables before each test. Right now it uses the absolute path. I need to fix that.
  config.before(:each) do
    load '/Users/awdem/Projects/chitter-challenge/db/seeds.rb'
  end

end