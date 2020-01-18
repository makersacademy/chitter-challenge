def setup_test_database
  DatabaseConnection.setup('chitter_app_test')
  DatabaseConnection.query('TRUNCATE TABLE peeps')
end
