require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'database_cleaner'

ENV['RACK_ENV'] = 'test'

require './app/chitter'

RSpec.configure do |config|
  # config.run_all_when_everything_filtered = true
  # config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

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


Capybara.app = Sinatra::Application

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
