def truncate_test_db
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE TABLE peeps, users;')
end
