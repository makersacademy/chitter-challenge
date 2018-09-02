ENV['ENVIRONMENT'] = 'test'

require './app/app'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

Capybara.app = App

RSpec.configure do |config|

  config.before(:suite) do
    ActiveRecord::Base.logger = nil
    ["users", "messages"].each do |table|
      ActiveRecord::Base.connection.execute(File.read("db/setup/#{table}.sql"))
    end
  end

  config.before(:each) do
    User.delete_all
    Message.delete_all
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
