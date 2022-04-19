require 'pg'

def truncate_database 
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE TABLE peeps, users;")
end

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end