require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require File.join(File.dirname(__FILE__), 'features', 'web_helpers.rb')
require 'capybara/rspec'
require 'pg'
require 'rake'

Capybara.app = Chitter
# rake = Rake.application
# rake.init
# rake.load_rakefile
Rake.application.load_rakefile

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered drinking coffee? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Coffee. Coffee, coffee, coffee."
  end
end
