require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

ENV['CHATTER'] = 'TEST'

require File.expand_path('../app/chatter_app.rb', __dir__)
require File.expand_path('../lib/chat.rb', __dir__)
require File.expand_path('../lib/user.rb', __dir__)
require File.expand_path('../lib/database_connection.rb', __dir__)
require File.expand_path('./features/helpers.rb', __dir__)

Capybara.app = Chatter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) { setup_test_database }
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
