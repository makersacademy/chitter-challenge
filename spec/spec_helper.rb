ENV['RACK_ENV'] = 'test'

require './app'
require 'pg'
require 'rspec'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = ChitterApp

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

RSpec.configure do |config|
  config.before(:each) do
    connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
    connection.exec("TRUNCATE TABLE users")
    connection.exec("TRUNCATE TABLE peeps")
  end
end
