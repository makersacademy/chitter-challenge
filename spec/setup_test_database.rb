def setup_test_database
  p "..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
  connection.exec("TRUNCATE users;")
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end

def persisted_user(id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM users WHERE id = #{id};")
  result.first
end
