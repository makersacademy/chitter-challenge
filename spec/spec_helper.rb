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

# This allows RSpec to access the session params during testing.
def session
  last_request.env['rack.session']
end

RSpec.configure do |config|
  # This resets the database tables before each test.
  config.before(:each) do
    load File.join(__dir__, '../db/seeds.rb')
  end

end
