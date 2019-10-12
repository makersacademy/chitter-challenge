require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'posts_test')
  connection.exec("SELECT * FROM #{table} WHERE id = '#{id}';")
end
