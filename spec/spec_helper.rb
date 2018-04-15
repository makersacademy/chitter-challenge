require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # SimpleCov::Formatter::HTMLFormatter
])

SimpleCov.start do
   add_filter '/spec'
end

RSpec.configure do |config|
  ENV['RACK_ENV'] = 'test'
  require './app.rb'
  require 'rack/test'
  require 'capybara'
  require 'capybara/rspec'
  Capybara.app = ChitterApp

  config.before(:each) do
    conn = PG::Connection.open(:dbname => 'chitter_app_test')
    conn.exec_params('TRUNCATE users, peeps;')
  end
end
