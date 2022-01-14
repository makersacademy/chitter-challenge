def setup_test_database
  p "Setting up test database...#{self}"
  connection = PG.connect(dbname: 'chitterbase_test')
  connection.exec('TRUNCATE peeps;')
end
