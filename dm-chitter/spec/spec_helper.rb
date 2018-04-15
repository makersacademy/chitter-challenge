RSpec.configure do | config |
  ENV['RACK_ENV'] = 'test'
  require 'capybara/rspec'
  require 'capybara'
  require 'rspec'
  require 'simplecov'
  require 'simplecov-console'
  require 'app'
  require 'pg'
  Capybara.app = Controller

  config.before(:each) do
    clear_table
  end
end

SimpleCov.start

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])



def clear_table
  database = PG.connect :dbname => 'chit_test', :user => 'danielwork'
  database.exec("TRUNCATE posts;")
  database.exec("TRUNCATE users;")
  database.exec("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
  database.exec("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
end