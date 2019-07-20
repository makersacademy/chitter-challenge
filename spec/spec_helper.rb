ENV['ENVIRONMENT'] = 'test'

require 'rake'
Rake.application.load_rakefile

require_relative '../app.rb'

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Squiggler



require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end
end
