ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require_relative '../app.rb'
require_relative './setup_test_database'
require_relative '../lib/database_connection_setup'

require 'capybara'
require 'capybara/rspec'
require 'features/web_helpers'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'timecop'
require 'pg'

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].each { |f| require f }

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
