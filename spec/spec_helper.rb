require 'rake'
require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require './app'

ENV['ENVIRONMENT'] = 'test'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end
  config.after(:suite) do
    puts
    puts "\e[33mAll tests passing? COMMIT and PUSH to GitHub!!!\e[0m"
    puts
    puts "\e[33mDon't forget to lint your code with rubocop!\e[0m"
  end
end
