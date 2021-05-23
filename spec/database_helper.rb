require 'pg'
require './lib/database_connection'

def persisted_data(table:, id:)
  conn = PG.connect(dbname: 'chitter_test')
  conn.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
