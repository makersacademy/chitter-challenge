require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
# require_relative 'setup_test_data'

ENV['RACK_ENV'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])

SimpleCov.start

require 'rake'
Rake.application.load_rakefile

RSpec.configure do |config|

  config.before(:each) do
    Rake::Task['setup_test_data'].execute
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  require File.join(File.dirname(__FILE__), '..', 'app.rb')
  require 'capybara'
  require 'capybara/rspec'
  require 'rspec'
  require 'features/web_helpers'

  Capybara.app = ChitterApp

end
