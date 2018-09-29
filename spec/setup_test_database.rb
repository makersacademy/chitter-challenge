require 'pg'
require_relative '../lib/database_connection.rb'

def setup_test_database
  conn = PG.connect dbname: 'peeps_test'
  conn.exec ('TRUNCATE peeps')
end

def setup_user_database
  conn = PG.connect dbname: 'peeps_test'
  conn.exec ('TRUNCATE users, peeps')
end

def persisted_data(table:, id:)
  conn = PG.connect dbname: 'peeps_test'
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
