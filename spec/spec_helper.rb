require 'simplecov'
require 'simplecov-console'
require 'capybara'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Chitter

puts '------------------------------------'
puts 'Tables will be cleaned between tests'
puts '------------------------------------'

RSpec.configure do |config|
  config.before(:each) do
    system "bash", "-c", "rake test_setup"
  end
end
