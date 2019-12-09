def setup_tables
  connection = PG.connect(dbname: 'peeps_test')
  connection.exec("TRUNCATE TABLE messages, users")
end

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'peeps_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
