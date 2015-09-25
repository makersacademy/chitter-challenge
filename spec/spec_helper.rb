ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'coveralls'
require 'factory_girl'
require 'simplecov'
require './spec/factories/user.rb'
require './app/app.rb'


SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
