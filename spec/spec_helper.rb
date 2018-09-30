require 'simplecov'
require 'simplecov-console'
require 'timecop'
require 'pry'
require 'data_mapper'
require './models/peep'
require './models/user'
require 'web_helpers'

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  DataMapper::setup(:default, "postgres://andres@localhost/test_chitter")
  DataMapper.finalize

  config.before(:each) do
    DataMapper.auto_migrate!
    User.logout
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
