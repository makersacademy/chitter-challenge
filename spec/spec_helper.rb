ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'dm-postgres-adapter'
require 'simplecov'
require 'simplecov-console'
require './app/app'
require './app/models/peeps'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# RSpec.configure do |config|
#   config.after(:suite) do
#     puts
#     puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
#     puts "\e[33mTry it now! Just run: rubocop\e[0m"
#   end
# end
