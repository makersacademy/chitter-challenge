require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'sinatra/activerecord'
require_relative '../app'
require_relative 'features/web_helpers.rb'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    ActiveRecord::Base.connection.execute('TRUNCATE users')
    ActiveRecord::Base.connection.execute('TRUNCATE peeps')
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
