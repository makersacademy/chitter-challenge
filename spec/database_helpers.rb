require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'peep_manager_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
