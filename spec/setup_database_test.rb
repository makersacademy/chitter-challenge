def reset_test_database
  connect = PG.connect(dbname: 'chitter_manager_test')
  connect.exec("TRUNCATE chitters;")
end
