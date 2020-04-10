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
    motivation = [
      'Red Green Refactor!',
      'Commit after each RGR cycle!',
      'Focus on the simplest problem!',
      'Only change code to pass tests!',
    ].sample
    puts "\e[33m#{motivation}\e[0m"
  end
end
