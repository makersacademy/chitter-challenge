def empty_database
  connection = PG.connect(dbname: 'chitter_test')
  connect.exec('TRUNCATE users;')
end
