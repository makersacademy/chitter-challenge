require "coveralls"
require "simplecov"

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require "capybara"
require "capybara/rspec"
require "dm-rspec"

RSpec.configure do |config|
  config.include(DataMapper::Matchers)
end
