require 'pg'

def persisted_data(time:, table:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM #{table} WHERE time = '#{time}';")
end
