require "coveralls"
require "simplecov"

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require File.join(File.dirname(__FILE__), "..", "app", "app")
require "capybara"
require "capybara/rspec"
require "dm-rspec"

Capybara.app = ChitterApp


RSpec.configure do |config|
  config.include(DataMapper::Matchers)
end
