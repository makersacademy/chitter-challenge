require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database()
    setup_test_database_users()
  end
end

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
  end
end

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'chitter.rb')

Capybara.app = Chitter


"name: Alex handle: Alex1 email: test email password: password"
"name: Alex, handle: Alex1, email: test email password: password
ssword"
