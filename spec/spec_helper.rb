require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require './spec/features/web_helpers'

RSpec.configure do |config|

  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include TestHelpers

end


config.before(:suite) do
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)
end

config.before(:each) do
  DatabaseCleaner.start
end

config.after(:each) do
  DatabaseCleaner.clean
end
