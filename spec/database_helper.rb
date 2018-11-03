require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
  #result = connection.exec('SELECT * FROM peeps')
end
