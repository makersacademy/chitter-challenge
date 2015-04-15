ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'server'
require 'database_cleaner'
require 'capybara/rspec'

Capybara.app = Chitter

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

def log_in(username = 'cat', password = '12345')
  visit '/'
  fill_in('Login_username', with: username)
  fill_in('Login_password', with: password)
  click_button('Log In')
end

def sign_up(name = 'George', email = 'me@georgemcgowan.com',
            username = 'cat', password = '12345')
  visit '/'
  fill_in('Name', with: name)
  fill_in('Email', with: email)
  fill_in('Username', with: username)
  fill_in('Password', with: password)
  click_button('Sign Up')
end

def sign_out
  visit('/')
  click_button('Log Out')
end
