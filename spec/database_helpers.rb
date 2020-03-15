require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM users WHERE id = '#{id}';")
end
