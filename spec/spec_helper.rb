ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'


require File.join(File.dirname(__FILE__), '..', 'app/app.rb')


require './app/data_mapper_setup.rb'
require 'capybara/rspec'
require 'tilt/erb'
require 'database_cleaner'
require 'factory_girl'
require_relative './factories/user'
require_relative './factories/peep'
require_relative './factories/comment'

require_relative './helpers/sign_in_up'
require_relative './helpers/post_message'
require_relative './helpers/post_reply'

  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  Coveralls.wear!

Capybara.app = Chitter

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
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

end
