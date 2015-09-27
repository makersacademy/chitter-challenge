require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter ]
Coveralls.wear!

require 'capybara/rspec'
require_relative '../app/data_mapper_setup'
require_relative '../app/app'
require 'database_cleaner'
require 'factory_girl'
require_relative 'factories/user'
require_relative 'helpers/session'

Capybara.app = Chitter

RSpec.configure do |config|

  config.include SessionHelpers

  config.include FactoryGirl::Syntax::Methods

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
