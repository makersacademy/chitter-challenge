require './lib/db/connect.rb'
require './lib/db/create_tables.rb'

def test_connect_and_clean_table(table = nil)
  db_connection = Connect.initiate(:chitter)
  db_connection.exec("TRUNCATE TABLE #{table.to_s}") unless table.nil?
  return db_connection
end

def connect
  db_connection = Connect.initiate(:chitter)
end
