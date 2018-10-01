require 'simplecov'
require 'simplecov-console'

ENV['ENVIRONMENT'] = 'test'

require 'capybara'
require 'capybara/rspec'
require './app'
require 'rspec'

Capybara.app = ChitterManager

SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    DataMapper.setup(:default, 'postgres://jamie:@localhost/messages_manager_test')
    Post.auto_migrate!
    User.auto_migrate!
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
   SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
