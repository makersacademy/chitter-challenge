require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# SimpleCov Config goes ABOVE this line (before all other configuration)

require_relative './support/setup_test_database'

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative './../good_vibes'

Capybara.app = ChitterApp

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
    add_default_peeps_to_test_database
    add_default_users_to_test_database
  end

  config.after(:suite) do
    # RSpec good vibes section
    puts "\n\e[33m#{GoodVibes.vibe_check}\e[0m"
  end
end
