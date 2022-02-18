ENV['ENVIRONMENT'] = 'test'

require_relative './setup_test_database'
require 'simplecov'
require 'simplecov-console'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'orderly'

# require our Sinatra app file
require_relative '../app'
# require helpers
require_relative './features/web_helpers'
require_relative './model_helpers'

# tell Capybara about the app class
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:each) do
    setup_test_database
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop?\e[0m"
  end
end
