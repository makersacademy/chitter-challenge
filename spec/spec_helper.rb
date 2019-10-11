require 'simplecov'
require 'simplecov-console'
require_relative 'setup_testing_database'

ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app/chitter_app.rb')
require 'capybara/rspec'
# require 'features/web_helpers'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    setup_testing_database
  end
end

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
