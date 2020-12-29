require_relative '../database_connection.rb'
require 'active_record'

def setup_test_database
  p 'Setting up test database...'
  ActiveRecord::Base.connection.execute("TRUNCATE peeps, users")
end
