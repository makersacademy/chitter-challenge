require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'chitter.rb')
Capybara.app = Chitter

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mRubocop?\e[0m"
  end
end
