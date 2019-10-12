require File.join(File.dirname(__FILE__), '..', 'app.rb')
Dir[File.join(File.dirname(__FILE__), 'helpers/*.rb')].each { |file| require file }

ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require File.join(File.dirname(__FILE__), '..', 'config/environment.rb')

Capybara.app = Chitter

RSpec.configure do |config|
  config.before do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end
  config.after do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end
end


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
