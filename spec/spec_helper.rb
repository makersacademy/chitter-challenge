ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib/app.rb')

require 'byebug'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'dm-rspec'
require 'pry'
require 'rspec'
require 'tilt/erb'
require 'coveralls' # Makers
require 'simplecov' # Makers

SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

def app
  App
end

# def populate_links
#   link = Link.create(title: 'Makers Academy', url: 'http://makersacademy.se', description: 'Whatever', user_id: 1)
#   ['start-up', 'sweden', 'incubator'].each do |tag|
#     new_tag = Tag.first_or_create(title: tag)
#     link.tags << new_tag
#     link.save
#   end
# end

Capybara.app = App

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Rack::Test::Methods
  config.include(DataMapper::Matchers)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  #
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
  #
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
end
