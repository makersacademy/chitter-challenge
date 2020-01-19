require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.query("SELECT * FROM messages WHERE id = '#{id}';")


end