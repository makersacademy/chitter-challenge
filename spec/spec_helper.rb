ENV['RACK_ENV'] = 'test'
ENV['ENVIROMENT'] = 'test'

require_relative '../app.rb'
require_relative './database_helpers'
require 'features/web_helpers'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

#RSpec.configure do |config|
#   config.after(:suite) do
#     puts
#     puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
#     puts "\e[33mTry it now! Just run: rubocop\e[0m"
#   end
# end
