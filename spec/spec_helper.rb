require 'pg'
ENV['ENVIRONMENT'] = 'test'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'features/web_helpers'
require 'simplecov'
require 'simplecov-console'

RSpec.configure do |config|
  config.before(:each) do
    # setup_test_database
  end
end

# Tell Capybara to talk to BookmarkManager
Capybara.app = Chitter

SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    clear_test_db
  end
end

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
