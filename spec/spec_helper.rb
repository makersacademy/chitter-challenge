require './app'
require './spec/web_helpers'

require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'sinatra'

ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = Chitter

RSpec.configure do |config|

  config.before(:each) do
    setup_database
  end

end
