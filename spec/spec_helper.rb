# Set the environment to "test"
ENV['ENVIRONMENT'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'pony'
require 'rspec'
require 'rake'
require 'simplecov'
require 'simplecov-console'

Rake.application.load_rakefile

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# Email override for testing environment
Pony.override_options = {
  :via => :test
}

RSpec.configure do |config|

  config.before(:each) do
    Rake::Task['test_database_setup'].execute
    Mail::TestMailer.deliveries.clear
  end

  config.after(:each) do
    Mail::TestMailer.deliveries.clear
  end

  config.after(:suite) do
    # puts
    # puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    # puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
