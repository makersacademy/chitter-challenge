
def reset_users_test_table
  connection = PG.connect(dbname: 'chitter_database_test')
  connection.exec("TRUNCATE users;")
end

def reset_peep_test_table
  connection = PG.connect(dbname: 'chitter_database_test')
  connection.exec("TRUNCATE peeps;")
end
