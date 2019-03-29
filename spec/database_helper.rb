require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
