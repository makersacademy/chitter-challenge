require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require 'capybara'
require 'capybara/rspec'
require './spec/web_helper.rb'
require './app/app.rb'

Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL
end