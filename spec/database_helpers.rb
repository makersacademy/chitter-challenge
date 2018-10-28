
def reset_test_table
  connection = PG.connect(dbname: 'chitter_database_test')
  connection.exec("TRUNCATE users;")
end
