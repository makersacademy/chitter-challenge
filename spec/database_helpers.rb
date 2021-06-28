require 'pg'

def persisted_data(username:, table:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM #{table} WHERE username = '#{username}';")
end
