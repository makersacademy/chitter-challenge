require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM #{table} where id='#{id}';")
end
