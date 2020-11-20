require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chit_manager_test')
  result = connection.query("SELECT * FROM chits WHERE id = '#{id}';")
end