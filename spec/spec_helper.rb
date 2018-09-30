require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require_relative '../lib/db_helper.rb'
require_relative '../app/app.rb'

Capybara.app = Chitter
ENV['DATABASE'] = 'chitter_test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before do
    DBHelper.truncate_dbs
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
