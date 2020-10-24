require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect :dbname => 'chitter_manager_test'
  connection.exec("SELECT * from #{table} WHERE id = '#{id}';")
end