def clear_test_database
  con = PG.connect(dbname: 'chitter_manager_test')
  con.exec("TRUNCATE chitter;")
  con.exec("TRUNCATE users;")
end
