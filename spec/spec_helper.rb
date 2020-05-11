require 'simplecov'
require 'simplecov-console'
require_relative './webhelper_spec'
require 'rspec'
require 'capybara/rspec'
require 'capybara'
require 'pg'
require 'database_scripts'
require 'peep'
require 'person'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

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

# RSpec.configure do |config|
#   config.before(:each) do
#     clear_test_db
#   end
# end

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    empty_and_fill_test_db
  end
end
