require 'simplecov'
require 'simplecov-console'
require 'database_cleaner'
require 'capybara/rspec'
require './app/app'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console,])
SimpleCov.start

RSpec.configure do |config|
  config.before(:suite) do

  end

  config.before(:each) do

  end

  config.after(:each) do

  end

  config.after(:suite) do

  end
end
