def setup_test_database
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query('TRUNCATE peeps;')
end
