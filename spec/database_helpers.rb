require 'pg'
require './db_setup'

def persisted_data(table:, id:)
  DbConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end