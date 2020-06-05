def setup_test_database
  DatabaseConnection.query('TRUNCATE users CASCADE')
end
