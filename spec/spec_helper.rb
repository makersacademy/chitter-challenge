require 'simplecov'
require 'simplecov-console'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative '../app.rb'

require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-rspec'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_test")

ENV['RACK_ENV'] = 'test'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    test_database_set
      # config.include(DataMapper::Matchers)
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
