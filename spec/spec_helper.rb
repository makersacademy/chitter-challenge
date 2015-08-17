ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/chitter.rb')

require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require 'factory_girl'
require_relative 'helpers/session'

Capybara.app = Chitter

RSpec.configure do |config|

  config.include SessionHelpers

end

RSpec.configure do |config|

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

end

# RSpec
# spec/support/factory_girl.rb
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:all) do FactoryGirl.reload
  end
end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
