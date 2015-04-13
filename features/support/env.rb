ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/server.rb')
require 'database_cleaner'
require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require_relative 'rspec_before_after_helper'

Capybara.app = Chitter
DataMapper.auto_migrate!

DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :transaction

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end

class ChitterWorld

  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers

end

World do
  ChitterWorld.new
end
