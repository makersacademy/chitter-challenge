require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

ENV['CHITTER_CHALLENGE'] = 'TEST'

require File.expand_path('../app/chitter_app.rb', __dir__)
require File.expand_path('../lib/peep.rb', __dir__)
require File.expand_path('../lib/user.rb', __dir__)
require File.expand_path('../lib/database_connection.rb', __dir__)
require File.expand_path('./features/helpers.rb', __dir__)

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
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
