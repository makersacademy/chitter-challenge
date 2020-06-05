require 'capybara'
require 'capybara/rspec'
require 'rspec'

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mYOU GO GIRL!\e[0m"
    puts "\e[33mdont forget to drink water\e[0m"
  end
end
