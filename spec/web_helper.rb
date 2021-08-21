require './lib/db/connect.rb'
require './lib/db/create_tables.rb'

def connect
  db_connection = Connect.initiate(:chitter)
end