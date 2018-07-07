ENV['ENVIRONMENT'] = 'test'

require_relative '../app.rb'
require_relative './features/web_helpers.rb'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  # config.before(:each) do
  #   load 'setup_test_database.rb'
  # end
end

Capybara.app = Chitter
