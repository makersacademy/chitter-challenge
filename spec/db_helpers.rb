def setup_test_database
  connection = DatabaseConnection.setup('chitter_test')
  connection.query('truncate peeps, users')
  connection.query('alter sequence users_id_seq restart with 1')
  connection.query('alter sequence peeps_id_seq restart with 1')
end
