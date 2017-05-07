ENV['RACK_ENV'] = 'test'

require_relative '../app/app.rb'
require_relative './web_helper.rb'

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter
DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize.auto_upgrade!
DatabaseCleaner.strategy = :truncation

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

# As of ruby v2.1 no default arguments required (e.g. "email: "blah@blah.com"")
def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
