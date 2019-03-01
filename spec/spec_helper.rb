require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require './app.rb'
require 'capybara'
require 'rspec'
require './config.rb'
require_relative 'db_helper.rb'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    empty_database
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

ENV['RACK_ENV'] = 'test'

app_config = Config.read_config(ENV['RACK_ENV'])
ActiveRecord::Base.establish_connection(app_config[:db_url])

Capybara.app = Chitter
