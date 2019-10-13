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
  config.before do
    ActiveRecord::Base.subclasses.reverse_each(&:delete_all)
  end
  config.after do
    ActiveRecord::Base.subclasses.each.reverse_each(&:delete_all)
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
