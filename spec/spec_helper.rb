ENV['RACK_ENV'] = 'test'

Dir[File.join(File.dirname(__FILE__), 'helpers/*.rb')].each { |file| require file }
root = File.dirname(__FILE__)[0..-5]
require File.join(root, 'app.rb')
require File.join(root, 'app/models/init')
require File.join(root, 'config/environment.rb')

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before :each do
    Tag.delete_all
    UserPassword.delete_all
    Peep.delete_all
    User.delete_all
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
    Tag.delete_all
    UserPassword.delete_all
    Peep.delete_all
    User.delete_all
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
