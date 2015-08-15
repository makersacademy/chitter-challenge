require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'helpers/user'
require_relative '../app/app.rb'
Capybara.app = Chitter

RSpec.configure do |config|

  config.include UserHelpers

end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
