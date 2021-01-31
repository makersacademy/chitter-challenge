def clear_test_database
  # p 'Clearing test database...'
  connection = PG.connect dbname: 'Chitter_test'
  connection.exec('TRUNCATE peeps;')
end
